# frozen_string_literal: true

# Lesson model
class Lesson < ActiveRecord::Base
  has_many :levels
  belongs_to :topic
  has_many :progress_lesson
end
