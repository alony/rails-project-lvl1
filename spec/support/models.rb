# frozen_string_literal: true

class User
  attr_accessor :name

  def initialize(opts)
    opts.each_pair do |(attr, value)|
      send(:"#{attr}=", value)
    end
  end

  def persisted?
    false
  end
end
