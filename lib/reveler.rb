class Reveler < Thyng
  value_accessor :credentials, initial: Credentials.new

  def initialize(*)
    # self.credentials = Credentials.new
    super
  end

  def email=(email)
    credentials.email = email
  end

  def email
    credentials.email
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

end