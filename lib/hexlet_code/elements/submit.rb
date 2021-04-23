# frozen_string_literal: true

module HexletCode
  module Elements
    class Submit
      attr_accessor :label, :options

      def initialize(label, options)
        @label = label
        @options = options
      end

      def structure
        { tag: :input, options: { type: 'submit', name: 'commit', value: label } }
      end
    end
  end
end
