# frozen_string_literal: true

require 'rspec/expectations'

RSpec::Matchers.define :match_ignoring_indents do |expected|
  match do |actual|
    normalize(actual) == normalize(expected)
  end

  failure_message do |actual|
    %(
      expected that
      #{normalize(actual)}
      would be equal to
      #{normalize(expected)}
    )
  end

  def normalize(string)
    string.gsub(/\s+/, ' ').strip
  end
end
