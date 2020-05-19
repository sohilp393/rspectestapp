# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  let(:joe) do create(
      :contact,
      first_name: 'Joe',
      last_name: 'Button',
      email: 'tester@example.com')
  end
  let(:jones) do
    create(
      :contact,
      first_name: 'John',
      last_name: 'Jones',
      email: 'jones@example.com')
  end
  let(:wick) do
    create(
      :contact,
      first_name: 'John',
      last_name: 'Wick',
      email: 'wick@example.com')
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :first_name }

    it { is_expected.to validate_presence_of :last_name }

    it { is_expected.to validate_presence_of :email }

    it { is_expected.to validate_uniqueness_of :email }
  end

  describe '.by_letter' do
    context 'with matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq [jones]
      end
    end

    context 'without matching letters' do
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include wick
      end
    end
  end

  describe '#name' do
    it { expect(joe).to validate_presence_of :first_name }

    it { expect(joe).to validate_presence_of :last_name }

    it { expect(joe.name).to eq 'Joe Button' }
  end
end
