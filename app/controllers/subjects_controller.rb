class SubjectsController < ApplicationController
  allow_unauthenticated_access

  before_action :set_program

  def index
    @query    = params[:q].to_s.strip
    @category = params[:category].to_s.presence

    scope = Subject.where(branch: @program.branch, scheme: @program.scheme)
                   .where.not(kind: "elective_option")

    if @query.present?
      pattern = "%#{ActiveRecord::Base.sanitize_sql_like(@query)}%"
      scope = scope.where("name LIKE :p OR code LIKE :p", p: pattern)
    end

    scope = scope.where(category: @category) if @category

    @subjects             = scope.order(:semester, :id)
    @subjects_by_semester = @subjects.group_by(&:semester)
    @result_count         = @subjects.size
  end

  private

  def set_program
    @program = Program.find_by_slug!(params[:program_slug])
  end
end
