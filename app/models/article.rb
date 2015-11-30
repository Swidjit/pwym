class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_many :reactions

  acts_as_commentable
  acts_as_taggable

  after_create :add_title_and_slug

  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.truncate(25, :separator => ' ',omission: '')

    end
    self.slug =self.title.downcase.gsub(' ','-').gsub!(/[^0-9A-Za-z-]/, '')
    self.save
  end

end
