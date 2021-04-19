# frozen_string_literal: true

module HexletCode
  module Elements
    class Input
      using StringWithSafeMethods

      attr_accessor :field, :options

      def initialize(field, options)
        @field = field
        @options = options
      end

      def render
        label + input
      end

      def input
        raise NotImplementedError, 'to be implemented in subclasses'
      end

      def label
        Tag.build(:label, for: input_id) { @options.delete(:label) || field.attribute }
      end

      private

      def input_id
        field.attribute
      end

      def input_name
        "#{field.model_name}[#{field.attribute}]"
      end

      def input_class
        "#{field.model_name}_#{field.attribute}"
      end

      def sanitize_value(value)
        value.to_s.sanitize
      end
    end
  end
end
