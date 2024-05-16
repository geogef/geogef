class Lesson < ActiveRecord::Base
    has_many :levels
    has_one :topics
end