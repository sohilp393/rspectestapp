# frozen_string_literal: true

# Manages Contact
class Contact < ActiveRecord::Base
  has_many :phones
  accepts_nested_attributes_for :phones

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def self.by_letter(letter)
    where('last_name LIKE ?', "#{letter}%").order(:last_name)
  end

  def name
    [first_name, last_name].join(' ')
  end
end
