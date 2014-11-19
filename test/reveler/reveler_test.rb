require_relative '../test_config'

class RevelerTest < UnitTest
  def setup
    @email = 'animal@muppets.org'
    @password = 'password'
  end

  attr_reader :email, :password
  
  def test_stores_email
    reveler = Reveler.new email: email
    assert_equal({:email => email}, reveler)
  end

  def test_can_access_email
    reveler = Reveler.new email: email
    assert_equal email, reveler.email
  end

  def test_starts_not_banned
    reveler = Reveler.new
    assert_equal false, reveler.banned?
  end

  def test_can_ban_reveler
    reveler = Reveler.new
    reveler.ban
    assert reveler.banned?, 'Reveler should be banned'
  end

  def test_can_unban_reveler
    reveler = Reveler.new banned: true
    reveler.unban
    refute reveler.banned?, 'Reveler should not be banned'
  end

  def test_password_is_encrypted
    reveler = Reveler.new
    reveler.password = password
    assert_equal BCrypt::Password, reveler.password.class
  end

  def test_can_check_password
    reveler = Reveler.new password: password
    assert reveler.check_password(password), 'Password should check true'
  end
end