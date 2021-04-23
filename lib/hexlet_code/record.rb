# frozen_string_literal: true

module HexletCode
  class Record
    RecordField = Struct.new(:model_name, :attribute, :type, :value, keyword_init: true)

    def initialize(model)
      @model = model
    end

    def name
      return @model.model_name.singular if @model.respond_to?(:model_name)

      snakecase(@model.class.name)
    end

    def field(attribute)
      RecordField.new(
        model_name: name,
        attribute: snakecase(attribute),
        type: field_type(attribute),
        value: field_value(attribute)
      )
    end

    def persisted?
      @model.persisted? if @model.respond_to?(:persisted?)
    end

    private

    def field_type(attribute)
      return type_by_value(attribute) unless @model.class.respond_to?(:type_for_attribute)

      @model.class.type_for_attribute(attribute.to_s).type
    end

    def type_by_value(attribute)
      :boolean if [true, false].include?(field_value(attribute))
    end

    def field_value(attribute)
      @model.public_send(attribute)
    end

    def snakecase(string)
      string.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
    end
  end
end
