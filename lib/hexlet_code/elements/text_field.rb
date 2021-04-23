# frozen_string_literal: true

module HexletCode
  module Elements
    class TextField < Input
      def input
        { tag: :input,
          options: { type: 'text', id: input_id, class: input_class, name: input_name,
                     value: sanitize_value(field.value) } }
      end
    end
  end
end
