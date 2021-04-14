# frozen_string_literal: true

require 'form/version'
require 'support/string'
require 'form/tag_generator'
require 'form/builder'

module Form
  def self.form_for(model, options)
    builder = Builder.new(model, options)
    yield(builder) if block_given?
    builder.render
  end
end
