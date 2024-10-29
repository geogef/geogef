# frozen_string_literal: true

# ProgressLesson model
class ProgressLesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :lesson
  belongs_to :level
end
