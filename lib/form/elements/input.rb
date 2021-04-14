# frozen_string_literal: true

module Form
  module Elements
    class Input
      include ::Form::TagGenerator

      attr_accessor :field, :options

      def initialize(field, options)
        @field = field
        @options = options
      end

      def render
        raise NotImplementedError, 'to be implemented in subclasses'
      end

      private

      def input_name
        "#{field.model_name}[#{field.attribute}]"
      end

      def input_class
        "#{field.model_name}_#{field.attribute}"
      end
    end
  end
end
