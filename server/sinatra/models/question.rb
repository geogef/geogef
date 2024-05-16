class Question < ActiveRecord::Base
    validates :question, presence: true
    has_one :topic
    belongs_to :exam
end