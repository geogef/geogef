# frozen_string_literal: true

# Question model
class Question < ActiveRecord::Base
  validates :question, presence: true
  belongs_to :topic
  belongs_to :exam
end
