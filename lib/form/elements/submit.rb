# frozen_string_literal: true

module Form
  module Elements
    class Submit
      include ::Form::TagGenerator

      attr_accessor :label, :options

      def initialize(label, options)
        @label = label
        @options = options
      end

      def render
        tag(:input, {
          type: 'submit',
          value: label
        }.merge(options))
      end
    end
  end
end
