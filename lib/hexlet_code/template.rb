# frozen_string_literal: true

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'

  class Template
    def self.render(structure)
      options = structure[:options] || {}

      return Tag.build(structure[:tag], options) if %i[content nested].none? { |s| structure.key? s }

      Tag.build(structure[:tag], options) do
        structure[:content].presence || structure[:nested].map { |nested| render(nested) }.join
      end
    end
  end
end
