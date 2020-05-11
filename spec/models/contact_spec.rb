# frozen_string_literal: true

require 'rails_helper'
require 'faker'

RSpec.describe Contact, type: :model do
  it 'is valid with a firstname,lastname and email' do
    @contact = build(:contact)
    expect(@contact).to be_valid
  end

  it 'is invalid without a first_name' do
    @contact = build(:contact, first_name: nil)
    @contact.valid?
    expect(@contact.errors.full_messages.first).to include("can't be blank")
  end

  it 'is invalid without a last_name' do
    @contact = build(:contact, last_name: nil)
    @contact.valid?
    expect(@contact.errors.full_messages.first).to include("can't be blank")
  end

  it 'is invalid without a email address' do
    @contact = build(:contact, email: nil)
    @contact.valid?
    expect(@contact.errors[:email]).not_to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    Contact.create(
      first_name: 'Joe',
      last_name: 'Button',
      email: 'tester@example.com'
    )
    @contact = Contact.new(
      first_name: 'Jane',
      last_name: 'Button',
      email: 'tester@example.com'
    )
    @contact.valid?
    expect(@contact.errors[:email]).not_to include('Has already been taken')
  end

  it "returns a contact's full name as a string" do
    @contact = build(
      :contact,
      first_name: 'John',
      last_name: 'Doe',
      email: 'john@email.com'
    )
    expect(@contact.name).to eq 'John Doe'
  end

  describe 'filter last_name by letter' do
    before :each do
      @smith = Contact.create(
        first_name: 'John',
        last_name: 'Smith',
        email: 'jsmith@example.com'
      )

      @jones = Contact.create(
        first_name: 'Tim',
        last_name: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = Contact.create(
        first_name: 'John',
        last_name: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context 'with matching letters' do
      it 'returns a sorted array of results that match' do
        expect(Contact.by_letter('J')).to eq [@johnson, @jones]
      end
    end

    context 'non-matching letters' do
      it 'omits results that do not match' do
        expect(Contact.by_letter('J')).not_to include @smith
      end
    end
  end
end
