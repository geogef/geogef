# frozen_string_literal: true

class Material < ActiveRecord::Base
  belongs_to :level
  belongs_to :topic
end
