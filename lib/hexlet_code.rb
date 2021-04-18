# frozen_string_literal: true

require 'support/string'
require 'hexlet_code/record'
require 'hexlet_code/tag'
require 'hexlet_code/input_factory'
require 'hexlet_code/builder'

module HexletCode
  def self.form_for(model, options)
    builder = Builder.new(model, options)
    yield(builder) if block_given?
    builder.render
  end
end
