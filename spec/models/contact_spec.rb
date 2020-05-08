require 'rails_helper'

RSpec.describe Contact, :type => :model do
  it "is valid with a firstname,lastname and email" do
    contact = Contact.new(
      firstname: 'Aaron',
      lastname: 'Finch',
      email:'AaronFinch@gmail.com'
    )
    expect(contact).to be_valid
  end

  it "is invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).not_to include("Cannot be blank")
  end

  it "is invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).not_to include("Cannot be blank")
  end

  it "is invalid without a email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).not_to include("Cannot be blank")
  end    

  it "is invalid with a duplicate email address" do
    Contact.create(
        firstname:"Joe" , lastname:"Button",email:"tester@example.com"
      )
    contact = Contact.new(
        firstname:"Jane" , lastname:"Button",email:"tester@example.com"
      )
    contact.valid?
    expect(contact.errors[:email]).to include("Has already been taken") 
  end

  it "returns a contact's full name as a string" do
    contact= Contact.new(firstname:'John' , lastname:'Doe',email:'john@email.com')
    expect(contact.name).to eq 'John Doe'
  end

  it "returns a sorted array of result that match" do
    johnwick = Contact.create(
      firstname: 'John',
      lastname: 'Wick',
      email:'jwick@example.com'
      )

    smith = Contact.create(
      firstname: 'John',
      lastname: 'smith',
      email:'jsmith@example.com'
      )

    johnson = Contact.create(
      firstname: 'John',
      lastname: 'Johnson',
      email:'jjohnson@example.com'
      )

    expect(Contact.by_letter('J')).to eq [johnwick,johnson]
    end
end
