require_relative '../test_config'

class CredentialsTest < UnitTest
  def email
    'animal@muppets.org'
  end

  def password
    'password'
  end

  def credentials
    Credentials.new email: email, password: password
  end

  def test_stores_an_email
    assert_equal email, credentials.email
  end

  def test_password_is_encrypted
    assert_equal BCrypt::Password, credentials.password.class
  end

  def test_can_authenticate
    assert credentials.authenticate(password), 'Password should check true'
  end

  def test_successful_authentication_saves_login_time
    these_credentials = credentials
    DateTime.stub :now, DateTime.new(1999) do
      these_credentials.authenticate(password)
    end
    assert_equal DateTime.new(1999), these_credentials.last_login_at
  end

  def test_failed_authentication_does_not_record_login
    these_credentials = credentials
    these_credentials.authenticate('')
    assert_nil these_credentials.last_login_at, 'Should not have recorded a login'
  end
end
