# Program is a lightweight PORO (not an ActiveRecord model) — the directory
# of every syllabus the site supports. Subjects in the DB are tied to a
# program via the (branch, scheme) tuple on Subject. To add a program:
#   1. Append a hash to PROGRAMS below.
#   2. Seed Subject rows for that (branch, scheme) in db/seeds.rb.

class Program
  PROGRAMS = [
    {
      slug:        "ece-2024",
      branch:      "ECE",
      scheme:      "2024",
      name:        "Electronics and Computer Engineering",
      short:       "ECE",
      branch_code: "ER",
      group:       "B — Electrical Science",
      degree:      "B.Tech",
      university:  "APJ Abdul Kalam Technological University",
      tagline:     "Electronics and computer science, side by side.",
      description: "A roughly 50/50 split — hardcore CS subjects (Data Structures, OOP, COA, OS, DBMS, Networks, Algorithms, Machine Learning) alongside core electronics (VLSI, Embedded, DSP, Microprocessors, ICs)."
    }
  ].freeze

  attr_reader :slug, :branch, :scheme, :name, :short, :branch_code,
              :group, :degree, :university, :tagline, :description

  def self.all
    PROGRAMS.map { |attrs| new(**attrs) }
  end

  def self.find_by_slug(slug)
    attrs = PROGRAMS.find { |p| p[:slug] == slug }
    attrs && new(**attrs)
  end

  def self.find_by_slug!(slug)
    find_by_slug(slug) or raise ActiveRecord::RecordNotFound, "No program with slug #{slug.inspect}"
  end

  def initialize(slug:, branch:, scheme:, name:, short:, branch_code:, group:, degree:, university:, tagline:, description:)
    @slug, @branch, @scheme = slug, branch, scheme
    @name, @short, @branch_code = name, short, branch_code
    @group, @degree, @university = group, degree, university
    @tagline, @description = tagline, description
  end

  def title
    "#{degree} #{short}"
  end

  def subtitle
    "#{name} · #{scheme} Scheme"
  end

  def subjects
    Subject.where(branch: branch, scheme: scheme)
  end

  def curriculum_subjects
    subjects.where.not(kind: "elective_option")
  end

  def total_credits
    curriculum_subjects.sum(:credits)
  end

  def total_subjects_count
    curriculum_subjects.count
  end

  def total_semesters
    curriculum_subjects.distinct.count(:semester)
  end

  def total_electives_count
    subjects.where(kind: "elective_option").count
  end
end
