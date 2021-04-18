# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode do
  let(:user) do
    OpenStruct.new(
      name: user_name,
      description: description,
      model_name: OpenStruct.new(singular: 'user'),
      persisted?: persisted
    )
  end
  let(:user_name) { 'user name' }
  let(:description) { 'desc' }
  let(:persisted) { false }

  context 'without fields' do
    context 'with non-persisted object' do
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

    context 'with persisted object' do
      let(:persisted) { true }
      let(:expected_form) do
        %(
          <form action='/users' method='patch' class='user'>
          </form>
        )
      end

      it 'generates an empty form with patch method' do
        generated_html = described_class.form_for(user, url: '/users')
        expect(generated_html).to match_ignoring_indents(expected_form)
      end
    end
  end

  context 'with fields' do
    let(:expected_form) do
      %(
        <form action='/users' method='post' class='user'>
          <input type='text' class='user_name' name='user[name]' value='user name'>
          <textarea class='user_description' name='user[description]' value='desc' rows='20' cols='40'>
          <input type='submit' value='Save User now'>
        </form>
      )
    end

    it 'generates a form with input and submit' do
      expect(
        described_class.form_for(user, url: '/users') do |f|
          f.input :name
          f.input :description, as: :text
          f.submit 'Save User now'
        end
      ).to match_ignoring_indents(expected_form)
    end

    context 'with unsafe values' do
      let(:description) { '"> <script> alert("Hello unsafe")</script><"' }

      let(:expected_form) do
        %(
          <form action='/users' method='post' class='user'>
            <textarea class='user_description' name='user[description]' value='"&gt; alert("Hello unsafe")' rows='20' cols='40'>
            <input type='submit' value='Save User now'>
          </form>
        )
      end

      it 'generates a form with input and submit' do
        expect(
          described_class.form_for(user, url: '/users') do |f|
            f.input :description, as: :text
            f.submit 'Save User now'
          end
        ).to match_ignoring_indents(expected_form)
      end
    end
  end
end
