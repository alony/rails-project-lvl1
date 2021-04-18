# frozen_string_literal: true

module Form
  module Tag
    using StringWithSafeMethods

    class << self
      def build(type, options)
        tag = "<#{type} #{options_to_attributes(options)}>"
        if block_given?
          tag += %(
            #{yield}
            </#{type}>
          )
        end

        tag.html_safe
      end

      def options_to_attributes(options)
        options.map { |(key, value)| "#{key}='#{value}'" }.join(' ')
      end
    end
  end
end
