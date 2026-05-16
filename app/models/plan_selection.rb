class PlanSelection < ApplicationRecord
  belongs_to :degree_plan
  belongs_to :subject

  validates :elective_group, presence: true
  validates :elective_group, uniqueness: { scope: :degree_plan_id }
end
