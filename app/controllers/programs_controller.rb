class ProgramsController < ApplicationController
  allow_unauthenticated_access

  def index
    @query = params[:q].to_s.strip
    @programs = filter_programs(Program.all, @query)
  end

  def show
    @program = Program.find_by_slug!(params[:slug])

    @subjects   = @program.curriculum_subjects.order(:semester, :id)
    @by_semester = @subjects.group_by(&:semester)
    @total_credits_by_category = @subjects.group_by(&:category)
                                          .transform_values { |list| list.sum(&:credits) }
    @total_credits = @subjects.sum(&:credits)
  end

  private

  def filter_programs(programs, query)
    return programs if query.blank?

    needle = query.downcase
    programs.select do |p|
      [p.name, p.short, p.branch_code, p.tagline, p.description,
       p.scheme, p.degree, p.university, p.slug].any? do |haystack|
        haystack.to_s.downcase.include?(needle)
      end
    end
  end
end
