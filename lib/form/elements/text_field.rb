# frozen_string_literal: true

module Form
  module Elements
    class TextField < Input
      def render
        tag(:input, {
          type: 'text',
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name,
          value: field.value
        }.merge(options))
      end
    end
  end
end
