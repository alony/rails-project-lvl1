# frozen_string_literal: true

module Form::Elements
  class Input
    def initialize(field, options); end

    def render
      raise NotImplementedError, 'to be implemented in subclasses'
    end
  end
end
