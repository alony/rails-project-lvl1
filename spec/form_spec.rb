# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Form do
  let(:user) { User.new(name: user_name) }
  let(:user_name) { 'user name' }

  context 'without fields' do
    let(:expected_form) do
      %(
        <form action='/users' method='post' class='user'>
        </form>
      )
    end

    it 'generates an empty form' do
      generated_html = described_class.form_for(user, url: '/users')
      expect(generated_html).to match_ignoring_indents(expected_form)
    end
  end

  context 'with fields' do
    let(:expected_form) do
      %(
        <form action='/users' method='post' class='user'>
          <input type='text' class='user_name' name='user[name]' value='user name' />
          <input type='submit' value='Save User now' />
        </form>
      )
    end

    it 'generates a form with input and submit' do
      expect(
        described_class.form_for(user, url: '/users') do |f|
          f.input :name
          f.submit 'Save User now'
        end
      ).to match_ignoring_indents(expected_form)
    end
  end
end
