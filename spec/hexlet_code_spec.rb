# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HexletCode do
  let(:user) do
    OpenStruct.new(
      name: user_name,
      description: description,
      confirmed: true,
      status: 'client',
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
    context 'with field types explicitely given' do
      let(:expected_form) do
        %(
          <form action='/users' method='post' class='user'>
            <input type='text' class='user_name' name='user[name]' value='user name'>
            <textarea class='user_description' name='user[description]' value='desc' rows='100' cols='40'>
            <input type='checkbox' class='user_confirmed' name='user[confirmed]' checked='true'>
            <select class='user_status' name='user[status]'>
              <option value='client' selected='selected'> client </option>
              <option value='non-client'> non-client </option>
              <option value='potential client'> potential client </option>
            </select>
            <input type='submit' value='Save User now'>
          </form>
        )
      end

      it 'generates a form with input and submit' do
        expect(
          described_class.form_for(user, url: '/users') do |f|
            f.input :name, as: :text_field
            f.input :description, as: :text, rows: 100
            f.input :confirmed, as: :boolean
            f.input :status, as: :select, options: ['client', 'non-client', 'potential client']
            f.submit 'Save User now'
          end
        ).to match_ignoring_indents(expected_form)
      end
    end

    context 'with field types to be defined by values' do
      let(:expected_form) do
        %(
          <form action='/users' method='post' class='user'>
            <input type='text' class='user_name' name='user[name]' value='user name'>
            <input type='checkbox' class='user_confirmed' name='user[confirmed]' checked='true'>
            <input type='submit' value='Save'>
          </form>
        )
      end

      it 'generates a form with correct inputs' do
        expect(
          described_class.form_for(user, url: '/users') do |f|
            f.input :name
            f.input :confirmed
            f.submit
          end
        ).to match_ignoring_indents(expected_form)
      end
    end

    context 'with unsafe values' do
      let(:description) { '"> <script> alert("Hello unsafe")</script><"' }

      let(:expected_form) do
        %(
          <form action='/users' method='post' class='user'>
            <textarea class='user_description' name='user[description]' value='"&gt; alert("Hello unsafe")' rows='20' cols='40'>
          </form>
        )
      end

      it 'generates a form with sanitized value' do
        expect(
          described_class.form_for(user, url: '/users') do |f|
            f.input :description, as: :text
          end
        ).to match_ignoring_indents(expected_form)
      end
    end
  end
end
