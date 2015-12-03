class Article < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  has_many :reactions

  has_attached_file :image, :styles => { :large => "700x700>", :medium => "200x200>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  acts_as_taggable
  acts_as_commentable

  after_create :add_title_and_slug

  def add_title_and_slug
    if self.title.length == 0
      self.title = self.body.truncate(25, :separator => ' ',omission: '')

    end
    self.slug = self.title.gsub(/[^a-z0-9\s]/i, '').truncate(25, :separator => ' ',omission: '').downcase.gsub('  ',' ').gsub(' ','-')
    self.save
  end

end
