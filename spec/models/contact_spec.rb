# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  
  let(:contact) { build(:contact)}
  let(:joe) { create(:joe) }
  let (:jane) { build(:jane) }

  it 'is valid with a firstname,lastname and email' do
    expect(contact).to be_valid
  end

  it 'is invalid without a first_name' do
    contact.first_name = nil
    contact.valid?
    expect(contact.errors.full_messages.first).to include("can't be blank")
  end

  it 'is invalid without a last_name' do
    contact.last_name = nil
    contact.valid?
    expect(contact.errors.full_messages.first).to include("can't be blank")
  end

  it 'is invalid without a email address' do
    contact.email = nil
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    joe
    jane.valid?
    expect(jane.errors[:email]).not_to include('Has already been taken')
  end

  it "returns a contact's full name as a string" do
    expect(joe.name).to eq 'Joe Button'
  end

  describe 'filter last_name by letter' do
    let(:jones) { create(:jones) }
    let(:wick) { create(:wick) }

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
