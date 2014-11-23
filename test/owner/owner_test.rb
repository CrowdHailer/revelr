require_relative '../test_config'

class OwnerTest < UnitTest
  # def empty_account
  #   Account.create
  # end

  def telephone
    '+44 1234 567'
  end

  def contact_point
    ContactPoint.new telephone: telephone, email: email
  end

  def email
    'pingu@south.org'
  end

  def owner
    Owner.new name: 'steve'
  end

  def test_can_save_name
    owner = Owner.new name: 'kevin'
    Owner::Record.save owner
    assert_equal 'kevin', Owner::Record.last.name
    assert owner.guid, 'Owner should have id'
  end

  def test_can_get_all_work_contacts
    skip
    Account.create
    assert_equal ContactPoint, Account.get_all_work_contacts.first.class
  end

  def test_can_update_owner
    skip
    empty_account.update owner: owner
    assert_equal owner.name, Account.last.name
  end

  def test_can_update_owner_with_work_contact_point
    skip
    o = owner.merge(work_contact_point: contact_point)
    empty_account.update owner: o
    assert_equal telephone, Account.last.work_telephone
  end

  def test_get_compound_contact_point
    skip
    o = owner.merge(work_contact_point: contact_point)
    empty_account.update owner: o
    assert_equal contact_point, Account.last_owner.work_contact_point
  end
end
