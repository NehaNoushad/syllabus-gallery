class SubjectsController < ApplicationController
  def index
    @subjects_by_semester = Subject
      .for_program(branch: "ECE", scheme: "2019")
      .order(:semester, :id)
      .group_by(&:semester)
  end
end
