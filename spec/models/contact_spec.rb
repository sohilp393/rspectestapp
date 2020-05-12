# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  
  let(:contact) { build(:contact)}
  let(:joe) { create(:contact,
                    first_name: 'Joe',
                    last_name:'Button',
                    email: 'tester@example.com') }

  let(:jane) { create(:contact,
              first_name:'Jane',
              last_name: 'Test',
              email: 'jones@example.com') }

  describe 'Validations' do
    it {
      contact.first_name = nil
      expect(contact).to validate_presence_of :first_name
       }

    it {
      contact.last_name = nil
      expect(contact).to validate_presence_of :last_name
      }

    it {
      contact.email = nil
      expect(contact).to validate_presence_of :email
      }

    it {
      joe
      expect(jane).to validate_uniqueness_of :email
    }   
  end

  it 'is valid with a firstname,lastname and email' do
    expect(contact).to be_valid
  end

  it "returns a contact's full name as a string" do
    expect(joe.name).to eq 'Joe Button'
  end

  describe 'filter last_name by letter' do
    let(:jones) { create(:contact,
              first_name:'John',
              last_name: 'Jones',
              email: 'jones@example.com') }
    
    let(:wick) { create(:contact,
              first_name:'John',
              last_name: 'Wick',
              email: 'wick@example.com'  
               ) }

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
