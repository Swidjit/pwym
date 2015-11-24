class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :round_scores
  validates_uniqueness_of :user, scope: [:match]
end