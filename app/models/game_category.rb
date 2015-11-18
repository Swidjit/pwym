class GameCategory < ActiveRecord::Base
  has_many :games
end