# frozen_string_literal: true

module HexletCode
  class Builder
    attr_reader :record

    def initialize(model, options)
      @record = Record.new(model)
      @options = options
      @elements = []
    end

    def structure
      { tag: :form,
        options: { action: @options[:url], method: http_verb, class: form_class },
        nested: @elements.map(&:structure).flatten }
    end

    def input(attribute, options = {})
      field = record.field(attribute)
      type = options[:as] || field.type
      @elements << Elements.input_by_type(type).new(field, options)
    end

    def submit(label = 'Save', options = {})
      @elements << Elements::Submit.new(label, options)
    end

    private

    def form_class
      [@options[:class], record.name].compact.join(' ')
    end

    def http_verb
      @options[:method] || record.persisted? ? 'patch' : 'post'
    end
  end
end
