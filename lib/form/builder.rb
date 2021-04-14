# frozen_string_literal: true

module Form
  class Builder
    using StringWithSafeMethods

    attr_accessor :template

    def initialize(model, options)
      @model = model
      @options = options
      @template = []
    end

    def render
      content = template.join("\n")
      form_tag(content)
    end

    def input(name, options = {})
      @template << TagGenerator.tag(:input, {
        type: 'text',
        class: [options.delete(:class), "#{model_name}_#{name}"].compact.join(' ')
      }.merge(options))
    end

    private

    def form_tag(content)
      TagGenerator.paired_tag(:form, content, {
        action: @options.delete(:url),
        method: 'post',
        class: [@options.delete(:class), model_name].compact.join(' ')
      }.merge(@options))
    end

    def model_name
      @model.class.name.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
