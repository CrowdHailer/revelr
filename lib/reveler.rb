class Reveler < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def email
    self.fetch(:email)
  end

  def email=(email)
    self[:email] = email
  end

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

  def banned?
    self.fetch(:banned, false)
  end

  def ban
    self.banned = true
  end

  def unban
    self.banned = false
  end

  private

  def banned=(value)
    self[:banned] = value
  end

  def crypted_password
    self.fetch(:crypted_password)
  end

  def crypted_password=(crypted_password)
    self[:crypted_password] = crypted_password
  end

  def check_password(candidate)
    password == candidate
  end

  def record_login
    self[:last_login_at] = DateTime.now
  end
end