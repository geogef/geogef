class ProgressLesson < ActiveRecord::Base
    has_one :user
    has_one :lesson
    has_one :level
end