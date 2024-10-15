# frozen_string_literal: true

class Option < ActiveRecord::Base
  validates :response, presence: true
  has_one :topic
end
