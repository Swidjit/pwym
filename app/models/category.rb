class Category < ActiveRecord::Base
  has_many :articles

  after_create :add_slug

  def add_slug
    self.slug =self.title.downcase.gsub(' ','-')
    self.save
  end
end