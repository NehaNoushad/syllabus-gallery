class CurriculumController < ApplicationController
  allow_unauthenticated_access

  BRANCH = "ECE"
  SCHEME = "2019"

  def show
    @subjects = Subject.for_program(branch: BRANCH, scheme: SCHEME)
                       .where.not(kind: "elective_option")
                       .order(:semester, :id)
    @by_semester = @subjects.group_by(&:semester)

    @total_credits_by_category = @subjects.group_by(&:category)
                                          .transform_values { |list| list.sum(&:credits) }
    @total_credits = @subjects.sum(&:credits)
  end
end
