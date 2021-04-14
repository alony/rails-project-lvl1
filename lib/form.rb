# frozen_string_literal: true

require 'support/string'
require 'form/record'
require 'form/tag_generator'
require 'form/input_factory'
require 'form/builder'

module Form
  def self.form_for(model, options)
    builder = Builder.new(model, options)
    yield(builder) if block_given?
    builder.render
  end
end
