# frozen_string_literal: true

class ProgressLesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :level
end
