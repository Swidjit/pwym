class Game < ActiveRecord::Base
  has_and_belongs_to_many :game_categories
  after_create :add_title_and_slug

  def add_title_and_slug
    self.slug = self.title.truncate(25, :separator => ' ',omission: '').downcase.gsub(' ','-')
    self.save
  end
end