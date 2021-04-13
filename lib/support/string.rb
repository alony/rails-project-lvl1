# frozen_string_literal: true

require 'action_view'

module StringWithSafeMethods
  refine String do
    # for html_safe and safe_concat methods
    include ActionView::Helpers::TextHelper
  end
end
