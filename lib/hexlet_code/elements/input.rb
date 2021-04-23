# frozen_string_literal: true

require 'rails-html-sanitizer'

module HexletCode
  module Elements
    class Input
      attr_accessor :field, :options

      def initialize(field, options)
        @field = field
        @options = options
      end

      def structure
        [label, input]
      end

      def input
        raise NotImplementedError, 'to be implemented in subclasses'
      end

      def label
        { tag: :label, options: { for: input_id }, content: options[:label] || field.attribute }
      end

      private

      def input_id
        field.attribute
      end

      def input_name
        field.attribute
      end

      def input_class
        [options[:class], "#{field.model_name}_#{field.attribute}"].compact.join(' ')
      end

      def sanitize_value(value)
        Rails::Html::SafeListSanitizer.new.sanitize(value.to_s)
      end
    end
  end
end
