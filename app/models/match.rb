class Match < ActiveRecord::Base
  has_many :entries, :dependent=>:delete_all
  has_and_belongs_to_many :games

end