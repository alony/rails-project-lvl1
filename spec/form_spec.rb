# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Form do
  let(:user) { User.new(name: user_name) }
  let(:user_name) { 'user name' }

  context 'without fields' do
    let(:expected_form) do
      "<form action='/users' method='post' class='user'>\n</form>"
    end

    it 'generates an empty form' do
      expect(described_class.form_for(user, url: '/users')).to eq expected_form
    end
  end

  context 'with fields' do
    let(:expected_form) do
      ["<form action='/users' method='post' class='user'>",
       "<input type='text' name='user_name' class='user' value='user name'/>",
       "<input type='submit' name='commit' value=''>",
       '</form>'].join("\n")
    end

    it 'generates a form with inputs' do
      expect(
        described_class.form_for(user, url: '/users', class: 'create_user') do |f|
          f.input :name
          f.submit
        end
      ).to eq expected_form
    end
  end
end
