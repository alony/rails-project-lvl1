# frozen_string_literal: true

module HexletCode
  module Elements
    class TextField < Input
      def input
        Tag.build(:input, {
          type: 'text',
          id: input_id,
          class: input_class,
          name: input_name,
          value: sanitize_value(field.value)
        }.merge(options))
      end
    end
  end
end
