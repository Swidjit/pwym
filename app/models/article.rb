class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_many :reactions


  acts_as_taggable

  after_create :add_title_and_slug

  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.truncate(25, :separator => ' ',omission: '')

    end
    self.slug = self.title.truncate(25, :separator => ' ',omission: '').downcase.gsub(' ','-')
    self.save
  end

end
