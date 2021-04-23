# frozen_string_literal: true

module HexletCode
  module Elements
    class Checkbox < Input
      def structure
        [input, label]
      end

      def input
        { tag: :input,
          options: { type: 'checkbox', id: input_id, class: input_class, name: input_name }.merge(checked) }
      end

      private

      def checked
        field.value ? { checked: true } : {}
      end
    end
  end
end
