require_relative '../test_config'

class AccountTest < UnitTest
  def empty_account
    Account.create
  end

  def telephone
    '+44 1234 567'
  end

  def contact_point
    ContactPoint.new telephone: telephone, email: email
  end

  def email
    'pingu@south.org'
  end

  def test_can_update_work_contact_point
    empty_account.update work_contact_point: contact_point
    assert_equal({work_email: email, work_telephone: telephone}, Account.last.values.select{|k| k == :work_telephone || k == :work_email})
  end

  def test_can_get_all_work_contacts
    Account.create
    assert_equal ContactPoint, Account.get_all_work_contacts.first.class
  end
end
