class DegreePlan < ApplicationRecord
  belongs_to :user
  has_many :plan_selections, dependent: :destroy
  has_many :selected_subjects, through: :plan_selections, source: :subject

  validates :title, presence: true
  validates :branch, presence: true
  validates :scheme, presence: true

  # Returns chosen subject for a given elective_group, or nil.
  def selection_for(elective_group)
    plan_selections.find_by(elective_group: elective_group)&.subject
  end
end
