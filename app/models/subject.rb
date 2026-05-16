class Subject < ApplicationRecord
  validates :name, :credits, :category, :semester, :branch, :scheme, presence: true

  CATEGORY_LABELS = {
    "math" => "Mathematics",
    "sci"  => "Basic Science",
    "esc"  => "Engineering Science",
    "core" => "ECE Core",
    "cs"   => "CS / Software",
    "hmc"  => "Humanities",
    "lab"  => "Lab / Workshop",
    "proj" => "Project / Seminar",
    "elec" => "Elective",
    "mnc"  => "Non-credit"
  }.freeze

  scope :for_program, ->(branch:, scheme:) { where(branch: branch, scheme: scheme) }

  def category_label
    CATEGORY_LABELS.fetch(category, category)
  end
end
