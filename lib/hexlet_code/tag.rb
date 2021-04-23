# frozen_string_literal: true

module HexletCode
  module Tag
    class << self
      def build(type, options)
        tag = "<#{type} #{options_to_attributes(options)}>"
        return html_safe(tag) unless block_given?

        content = yield
        html_safe("#{tag} #{content} </#{type}>")
      end

      def options_to_attributes(options)
        options.map { |(key, value)| "#{key}='#{value}'" }.join(' ')
      end

      def html_safe(html)
        ActiveSupport::SafeBuffer.new(html)
      end
    end
  end
end
