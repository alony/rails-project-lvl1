# frozen_string_literal: true

require 'action_view'

module StringWithSafeMethods
  refine String do
    # for html_safe and sanitize methods
    include ActionView::Helpers::TextHelper

    def sanitize
      sanitizer = Rails::Html::Sanitizer.safe_list_sanitizer.new
      sanitizer.sanitize(self, {})&.html_safe
    end
  end
end

module StringWithSnakeCase
  refine String do
    def to_snakecase
      gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
