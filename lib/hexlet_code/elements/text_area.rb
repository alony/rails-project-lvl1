# frozen_string_literal: true

module HexletCode
  module Elements
    class TextArea < Input
      DEFAULT_ROWS = 20
      DEFAULT_COLS = 40

      def input
        {
          tag: :textarea, options: {
            id: input_id, class: input_class, name: input_name,
            value: sanitize_value(field.value),
            rows: options[:rows] || DEFAULT_ROWS,
            cols: options[:cols] || DEFAULT_COLS
          }
        }
      end
    end
  end
end
