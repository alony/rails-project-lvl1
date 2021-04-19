# frozen_string_literal: true

module HexletCode
  module Elements
    class Checkbox < Input
      def render
        input + label
      end

      def input
        Tag.build(:input, {
          type: 'checkbox',
          id: input_id,
          class: input_class,
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
