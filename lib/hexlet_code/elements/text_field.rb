# frozen_string_literal: true

module HexletCode
  module Elements
    class TextField < Input
      def render
        Tag.build(:input, {
          type: 'text',
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name,
          value: sanitize_value(field.value)
        }.merge(options))
      end
    end
  end
end
