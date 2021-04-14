# frozen_string_literal: true

require 'action_view'

module StringWithSafeMethods
  refine String do
    # for html_safe and safe_concat methods
    include ActionView::Helpers::TextHelper
  end
end

module StringWithSnakeCase
  refine String do
    def to_snakecase
      gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
