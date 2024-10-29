# frozen_string_literal: true

require_relative 'helpers/authentication_helpers'
require_relative 'helpers/progress_helpers'
require_relative 'helpers/question_helpers'
require_relative 'helpers/html_helpers'

helpers do
  include AuthenticationHelpers
  include ProgressHelpers
  include QuestionHelpers
  include HtmlHelpers
end
