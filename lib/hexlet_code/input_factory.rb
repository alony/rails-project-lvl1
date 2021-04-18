# frozen_string_literal: true

require_relative 'elements/input'
require_relative 'elements/checkbox'
require_relative 'elements/select'
require_relative 'elements/submit'
require_relative 'elements/text_area'
require_relative 'elements/text_field'

module HexletCode
  class InputFactory
    def self.input(type)
      case type
      when :boolean
        Elements::Checkbox
      when :select
        Elements::Select
      when :text
        Elements::TextArea
      else
        Elements::TextField
      end
    end
  end
end
