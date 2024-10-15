# frozen_string_literal: true

# Material model
class Material < ActiveRecord::Base
  belongs_to :level
  belongs_to :topic
end
