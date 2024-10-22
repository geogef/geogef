# frozen_string_literal: true

# Contries model
class Country < ActiveRecord::Base
  validates :name, presence: true
end
