# frozen_string_literal: true

class Qa < ActiveRecord::Base
  belongs_to :option, foreign_key: 'options_id'
  belongs_to :question, foreign_key: 'questions_id'
  belongs_to :exam
end
