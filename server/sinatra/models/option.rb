class Option < ActiveRecord::Base
    validates :response, presence: true
    has_one :topic
end