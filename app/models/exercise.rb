class Exercise < ActiveRecord::Base
  belongs_to :exercise_category
  acts_as_commentable
end