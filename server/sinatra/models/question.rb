class Question < ActiveRecord::Base
    validates :question, presence: true
    belongs_to :topic
    belongs_to :exam
end