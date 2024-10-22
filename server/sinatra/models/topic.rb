# frozen_string_literal: true

# Topic model
class Topic < ActiveRecord::Base
  has_many :lessons, class_name: 'Lesson', foreign_key: 'topics_id'
  has_many :questions
  has_many :materials
end
