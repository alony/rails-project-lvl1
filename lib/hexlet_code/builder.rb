# frozen_string_literal: true

module HexletCode
  class Builder
    using StringWithSafeMethods

    attr_reader :record

    delegate :name, :persisted?, to: :record, prefix: true

    def initialize(model, options)
      @record = Record.new(model)
      @options = options
      @elements = []
    end

    def render
      form_tag do
        @elements.map(&:render).join(' ')
      end
    end

    def input(attribute, options = {})
      field = record.field(attribute)
      type = options.delete(:as) || field.type
      @elements << InputFactory.input(type).new(field, options)
    end

    def submit(label = 'Save', options = {})
      @elements << Elements::Submit.new(label, options)
    end

    private

    def form_tag
      Tag.build(:form, {
        action: @options.delete(:url),
        method: http_verb,
        class: [@options.delete(:class), record_name].compact.join(' ')
      }.merge(@options), &proc)
    end

    def http_verb
      @options.delete(:method) || record_persisted? ? 'patch' : 'post'
    end
  end
end
