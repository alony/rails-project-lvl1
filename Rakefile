# frozen_string_literal: true

require 'rubocop'

task(:rubocop) do
  cli = RuboCop::CLI.new
  raise unless cli.run.zero?
end
