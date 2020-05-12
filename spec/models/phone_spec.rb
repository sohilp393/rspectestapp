# frozen_string_literal: true

require 'rails_helper'
require 'faker'

 describe Phone, type: :model do
    it 'does not allow duplicate phone number per contact' do
      create(:contact)
      create(:home_phone,
			contact: contact,
			phone: '785-555-1234'
		)
    mobile_phone = build(:mobile_phone, contact: contact, phone: '785-555-1234')
		mobile_phone.valid?
    expect(mobile_phone.errors[:phone]).to include('has already been taken')
  end
  it 'allows two contacts to share a phone number' do
    create(:home_phone, phone: '785-555-123')
    expect(build(:home_phone, phone: '785-555-123')).to be_valid
  end
end
