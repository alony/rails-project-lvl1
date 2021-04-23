# frozen_string_literal: true

module HexletCode
  module Elements
    autoload :Input, 'hexlet_code/elements/input.rb'
    autoload :Checkbox, 'hexlet_code/elements/checkbox.rb'
    autoload :Select, 'hexlet_code/elements/select.rb'
    autoload :TextArea, 'hexlet_code/elements/text_area.rb'
    autoload :TextField, 'hexlet_code/elements/text_field.rb'
    autoload :Submit, 'hexlet_code/elements/submit.rb'

    def self.input_by_type(type)
      { boolean: Checkbox, select: Select, text: TextArea }[type] || TextField
    end
  end
end
