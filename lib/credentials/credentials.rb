require 'thyng/crypted_aspect'
class Credentials < Thyng
  extend Thyng::CryptedAspect
  aspect_accessor :email
  crypted_accessor :password

  def authenticate(candidate)
    check_password?(candidate) && record_login
  end

  def last_login_at
    self.fetch(:last_login_at, nil)
  end

  private

  def record_login
    self[:last_login_at] = DateTime.now
  end
end