# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop'

task(:rubocop) do
  cli = RuboCop::CLI.new
  raise unless cli.run.zero?
end
