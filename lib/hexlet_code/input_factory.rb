# frozen_string_literal: true

require_relative 'elements/input'
Dir.glob("#{File.dirname(File.absolute_path(__FILE__))}/elements/*").sort.each(&method(:require))

module HexletCode
  class InputFactory
    def self.input(type)
      case type
      when :boolean
        Elements::Checkbox
      when :text
        Elements::TextArea
      else
        Elements::TextField
      end
    end
  end
end
