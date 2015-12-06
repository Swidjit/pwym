class Post < ActiveRecord::Base

  belongs_to :user

  has_many :reactions
  has_many :websites
  has_many :url_images
  has_many :url_videos

  accepts_nested_attributes_for :websites,:url_videos, :url_images

  acts_as_commentable
  acts_as_taggable

  after_create :add_title_and_slug

  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.truncate(25, :separator => ' ',omission: '')

    end
    self.slug =self.title.gsub(' ','-')
    self.save
  end

end
