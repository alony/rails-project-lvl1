# frozen_string_literal: true

require 'active_support'

module HexletCode
  autoload :Record, 'hexlet_code/record.rb'
  autoload :Builder, 'hexlet_code/builder.rb'
  autoload :Template, 'hexlet_code/template.rb'
  autoload :Elements, 'hexlet_code/elements.rb'

  def self.form_for(model, options)
    builder = Builder.new(model, options)
    yield(builder) if block_given?
    Template.render(builder.structure)
  end
end
