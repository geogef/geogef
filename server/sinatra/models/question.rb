# frozen_string_literal: true

class Question < ActiveRecord::Base
  validates :question, presence: true
  belongs_to :topic
  belongs_to :exam
end
