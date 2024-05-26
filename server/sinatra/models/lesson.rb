class Lesson < ActiveRecord::Base
    has_many :levels
    belongs_to :topic
    has_many :progress_lesson
end
