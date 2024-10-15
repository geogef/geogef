# frozen_string_literal: true

class Country < ActiveRecord::Base
  validates :name, presence: true
end
