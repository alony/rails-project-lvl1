# frozen_string_literal: true

module Form
  class Builder
    using StringWithSafeMethods

    attr_accessor :template

    def initialize(model, options)
      @model = model
      @options = options
      @template = [form_tag]
    end

    def render
      template.join("\n").html_safe
    end

    private

    def form_tag
      "<form action='#{@options[:url]}' method='post' class='#{model_name}'>\n</form>"
    end

    def model_name
      @model.class.name.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
