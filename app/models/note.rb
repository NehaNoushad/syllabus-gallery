class Note < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :title,   length: { maximum: 120 }, allow_blank: true

  scope :latest, -> { order(created_at: :desc) }
end
