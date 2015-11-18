class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  validates_uniqueness_of :user, scope: [:match]
end