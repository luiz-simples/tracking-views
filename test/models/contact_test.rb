require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "Contact is invalid when without email" do
    contact = Contact.new name: 'Name Contact', message: 'Message Text'
    assert contact.invalid?
  end

  test "Contact is invalid when without name" do
    contact = Contact.new email: 'name@contact.com', message: 'Message Text'
    assert contact.invalid?
  end

  test "Contact is invalid when without message" do
    contact = Contact.new name: 'Name Contact', email: 'name@contact.com'
    assert contact.invalid?
  end

  test "Contact is invalid when without valid email" do
    contact = Contact.new name: 'Name Contact', email: 'name@', message: 'Message Text'
    assert contact.invalid?
  end

  test "Contact is valid when all data is filled" do
    contact = Contact.new name: 'Name Contact', email: 'name@email.com', message: 'Message Text'
    assert contact.valid?
  end
end
