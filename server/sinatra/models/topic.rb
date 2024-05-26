class Topic < ActiveRecord::Base
    has_many :lessons, class_name: 'Lesson', foreign_key: 'topics_id'
end
