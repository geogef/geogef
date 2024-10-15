class Exam < ActiveRecord::Base
    has_many :qas
    belongs_to :level
    belongs_to :lesson
end
