# frozen_string_literal: true

# Manages phone
class Phone < ActiveRecord::Base
  validates :phone, presence: true, length: { maximum: 15 }
  belongs_to :contact
end
