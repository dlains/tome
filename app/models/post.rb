class Post < ApplicationRecord
  belongs_to :user
  acts_as_taggable_on :tags
  validates :title, :slug, presence: true

  scope :published,   -> { where(published: true) }
  scope :unpublished, -> { where(published: false) }

  def to_param
    slug
  end

  def previous_article
    self.class.published.where('id < ?', self.id).last
  end

  def next_article
    self.class.published.where('id > ?', self.id).first
  end
end
