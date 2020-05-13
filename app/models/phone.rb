# frozen_string_literal: true

# Manages phone
class Phone < ActiveRecord::Base
  belongs_to :contact

  validates :phone, presence: true, length: {maximum: 10}
end
