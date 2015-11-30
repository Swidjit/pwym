class GameCategory < ActiveRecord::Base
  has_many :games

  after_create :add_title_and_slug

  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.truncate(25, :separator => ' ',omission: '')

    end
    self.slug =self.title.downcase.gsub(' ','-')
    self.save
  end
end