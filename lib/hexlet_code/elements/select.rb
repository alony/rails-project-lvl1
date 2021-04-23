# frozen_string_literal: true

module HexletCode
  module Elements
    class Select < Input
      def input
        { tag: :select, options: { id: input_id, class: input_class, name: input_name }, nested: select_options }
      end

      private

      def select_options
        return [] if options[:options].nil?

        [*options[:options]].map do |element|
          { tag: :option, options: { value: element }, content: element }.tap do |opts|
            opts[:options][:selected] = 'selected' if field.value.to_s == element.to_s
          end
        end
      end
    end
  end
end
