# frozen_string_literal: true

module HtmlHelpers
  def h(text)
    ERB::Util.h(text)
  end
end
