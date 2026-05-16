class Subject < ApplicationRecord
  validates :name, :credits, :category, :branch, :scheme, presence: true
  # semester is required for everything except elective_option rows (the pool of choices).
  validates :semester, presence: true, unless: -> { kind == "elective_option" }

  CATEGORY_LABELS = {
    "math" => "Mathematics",
    "sci"  => "Basic Science",
    "esc"  => "Engineering Science",
    "core" => "ECE Core",
    "cs"   => "CS / Software",
    "hmc"  => "Humanities",
    "lab"  => "Lab / Workshop",
    "proj" => "Project / Seminar",
    "elec" => "Elective"
  }.freeze

  scope :for_program, ->(branch:, scheme:) { where(branch: branch, scheme: scheme) }

  def category_label
    CATEGORY_LABELS.fetch(category, category)
  end
end
