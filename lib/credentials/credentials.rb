require './lib/thyng/thyng'

class Credentials < Thyng
  value_accessor :email
  value_accessor :crypted_password

  def password
    BCrypt::Password.new crypted_password
  end

  def password=(password)
    self.crypted_password = BCrypt::Password.create(password).to_s    
  end

  def authenticate(candidate)
    check_password(candidate) && record_login
  end

  def last_login_at
    self.fetch(:last_login_at, nil)
  end

  private

  def check_password(candidate)
    password == candidate
  end

  def record_login
    self[:last_login_at] = DateTime.now
  end
end