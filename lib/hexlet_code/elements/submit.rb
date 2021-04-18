# frozen_string_literal: true

module HexletCode
  module Elements
    class Submit
      attr_accessor :label, :options

      def initialize(label, options)
        @label = label
        @options = options
      end

      def render
        Tag.build(:input, {
          type: 'submit',
          value: label
        }.merge(options))
      end
    end
  end
end
