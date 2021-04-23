# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'

  class Template
    def self.render(structure)
      return Tag.build(structure[:tag], structure[:options] || {}) if %i[content nested].none? { |s| structure.key? s }

      block = lambda {
        return structure[:content] if structure[:content].present?

        structure[:nested].map { |nested| render(nested) }.join
      }

      Tag.build(structure[:tag], structure[:options] || {}, &block)
    end
  end
end
