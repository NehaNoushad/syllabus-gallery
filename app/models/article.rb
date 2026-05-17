class Article < ApplicationRecord
  belongs_to :user

  KINDS = %w[project guide note essay reading].freeze

  validates :title,   presence: true, length: { maximum: 160 }
  validates :slug,    presence: true, uniqueness: true,
                      format: { with: /\A[a-z0-9]+(?:-[a-z0-9]+)*\z/, message: "must be lowercase letters, digits, and dashes" }
  validates :excerpt, length: { maximum: 400 }, allow_blank: true
  validates :body,    presence: true
  validates :kind,    inclusion: { in: KINDS }, allow_blank: true

  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  scope :published, -> { where.not(published_at: nil).order(published_at: :desc) }
  scope :latest,    -> { order(Arel.sql("COALESCE(published_at, created_at) DESC")) }

  def published?
    published_at.present? && published_at <= Time.current
  end

  def to_param
    slug.presence || id.to_s
  end

  def kind_label
    kind.presence&.upcase || "POST"
  end

  private

  def generate_slug
    base = title.to_s.downcase
                .gsub(/[^a-z0-9\s-]/, "")
                .strip
                .gsub(/\s+/, "-")
                .gsub(/-+/, "-")
    base = base.presence || SecureRandom.hex(4)
    candidate = base
    n = 1
    while Article.where(slug: candidate).where.not(id: id).exists?
      n += 1
      candidate = "#{base}-#{n}"
    end
    self.slug = candidate
  end
end
