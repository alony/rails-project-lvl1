# frozen_string_literal: true

module HexletCode
  module Elements
    class Select < Input
      def input
        Tag.build(:select, {
          id: input_id,
          class: [options.delete(:class), input_class].compact.join(' '),
          name: input_name
        }.merge(options.except(:options))) { select_options }
      end

      private

      def select_options
        return if options[:options].nil?

        [*options.delete(:options)].map do |element|
          Tag.build(:option, option_options(element)) { element }
        end.join
      end

      def option_options(element)
        { value: element }.tap do |opts|
          opts[:selected] = 'selected' if field.value.to_s == element.to_s
        end
      end
    end
  end
end
