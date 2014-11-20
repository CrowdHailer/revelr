require_relative '../test_config'

class ContactPointTest < UnitTest
  def telephone
    '+44 1234 567'
  end

  def contact_point
    ContactPoint.new telephone: telephone, email: email
  end

  def email
    'pingu@south.org'
  end

  def test_saves_telephone_number
    assert_equal telephone, contact_point.telephone
  end

  def test_saves_email
    assert_equal email, contact_point.email
  end
end