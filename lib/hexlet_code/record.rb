# frozen_string_literal: true

module HexletCode
  class Record
    using StringWithSnakeCase

    RecordField = Struct.new(:model_name, :attribute, :type, :value, keyword_init: true)

    delegate :persisted?, to: :@model

    def initialize(model)
      @model = model
    end

    def name
      return @model.model_name.singular if @model.respond_to?(:model_name)

      @model.class.name.to_snakecase
    end

    def field(attribute)
      RecordField.new(
        model_name: name,
        attribute: attribute.to_s.to_snakecase,
        type: field_type(attribute),
        value: field_value(attribute)
      )
    end

    private

    def field_type(attribute)
      return type_by_value(attribute) unless @model.class.respond_to?(:type_for_attribute)

      @model.class.type_for_attribute(attribute.to_s).type
    end

    def field_value(attribute)
      @model.public_send(attribute)
    end

    def type_by_value(attribute)
      return :boolean if [true, false].include?(field_value(attribute))
    end
  end
end