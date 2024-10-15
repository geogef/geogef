# frozen_string_literal: true

# Helper methods for HTML utilities like escaping content.
module HtmlHelpers
  def h(text)
    ERB::Util.h(text)
  end
end
