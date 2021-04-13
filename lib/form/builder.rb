# frozen_string_literal: true

module Form
  class Builder
    using StringWithSafeMethods

    attr_reader :record

    delegate :name, :persisted?, to: :record, prefix: true

    def initialize(model, options)
      @record = Record.new(model)
      @options = options
      @elements = []
    end

    def input(attribute, options = {})
      field = record.field(attribute)
      type = options.delete(:as) || field.type
      @elements << InputFactory.input(type).new(field, options)
    end

    def submit(label = 'Save', options = {})
      @elements << Elements::Submit.new(label, options)
    end

    def render
      form_tag do
        @elements.map(&:render)
      end.join("\n").html_safe
    end

    private

    def form_tag
      [
        "<form action='#{@options.delete(:url)}' method='#{http_verb}' class='#{record_name}'>",
        yield,
        '</form>'
      ].flatten
    end

    def http_verb
      @options.delete(:method) || record_persisted? ? 'patch' : 'post'
    end
  end
end
