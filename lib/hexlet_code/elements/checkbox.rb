# frozen_string_literal: true

module HexletCode
  module Elements
    class Checkbox < Input
      def render
        Tag.build(:input, {
          type: 'checkbox',
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name
        }.merge(options).merge(checked))
      end

      private

      def checked
        field.value ? { checked: true } : {}
      end
    end
  end
end
