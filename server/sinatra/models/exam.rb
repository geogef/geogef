class Exam < ActiveRecord::Base
    has_many :qas
    belongs_to :level
end