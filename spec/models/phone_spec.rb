# frozen_string_literal: true

require 'rails_helper'
require 'faker'

describe Phone, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:contact) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :phone }

    it { is_expected.to validate_length_of :phone }
  end
end
