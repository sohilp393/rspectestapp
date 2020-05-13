# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  let(:contact) { build(:contact) }
  let(:joe) do
    create(
      :contact,
      first_name: 'Joe',
      last_name: 'Button',
      email: 'tester@example.com')
  end
  let(:jane) { build(:contact) }

  describe '#validations' do
    it { is_expected.to validate_presence_of :first_name }

    it { is_expected.to validate_presence_of :last_name }

    it { is_expected.to validate_presence_of :email }

    it do
      joe
      jane.email = 'tester@example.com'
      expect(jane).to validate_uniqueness_of :email
    end
  end

  describe '#fullname' do
    it { expect(joe.name).to eq 'Joe Button' }
  end

  describe '#filter last_name by letter' do
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
        email: 'wick@example.com'
      )
    end

    context 'with matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq [jones]
      end
    end

    context 'non-matching letters' do
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include wick
      end
    end
  end
end
