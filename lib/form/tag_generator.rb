# frozen_string_literal: true

module Form
  module TagGenerator
    using StringWithSafeMethods

    def tag(type, options)
      "<#{type} #{options_to_attributes(options)} />".html_safe
    end

    def paired_tag(type, content, options)
      %(
        <#{type} #{options_to_attributes(options)}>
        #{content}
        </#{type}>
      ).html_safe
    end

    def options_to_attributes(options)
      options.map { |(key, value)| "#{key}='#{value}'" }.join(' ')
    end
  end
end
