# frozen_string_literal: true

# Option model
class Option < ActiveRecord::Base
  validates :response, presence: true
  has_one :topic
end
