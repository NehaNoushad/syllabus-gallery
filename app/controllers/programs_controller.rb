class ProgramsController < ApplicationController
  allow_unauthenticated_access

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find_by_slug!(params[:slug])

    @subjects   = @program.curriculum_subjects.order(:semester, :id)
    @by_semester = @subjects.group_by(&:semester)
    @total_credits_by_category = @subjects.group_by(&:category)
                                          .transform_values { |list| list.sum(&:credits) }
    @total_credits = @subjects.sum(&:credits)
  end
end
