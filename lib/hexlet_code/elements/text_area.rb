# frozen_string_literal: true

module HexletCode
  module Elements
    class TextArea < Input
      DEFAULT_ROWS = 20
      DEFAULT_COLS = 40

      def input
        options[:rows] ||= DEFAULT_ROWS
        options[:cols] ||= DEFAULT_COLS

        Tag.build(:textarea, {
          id: input_id,
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name,
          value: sanitize_value(field.value)
        }.merge(options))
      end
    end
  end
end
