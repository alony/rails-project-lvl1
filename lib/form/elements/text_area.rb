# frozen_string_literal: true

module Form
  module Elements
    class TextArea < Input
      DEFAULT_ROWS = 20
      DEFAULT_COLS = 40

      def render
        options[:rows] ||= DEFAULT_ROWS
        options[:cols] ||= DEFAULT_COLS

        tag(:textarea, {
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name,
          value: field.value
        }.merge(options))
      end
    end
  end
end
