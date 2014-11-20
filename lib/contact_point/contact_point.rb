class ContactPoint < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def telephone=(telephone)
    self[:telephone] = telephone
  end

  def telephone
    fetch(:telephone)
  end

  def email=(email)
    self[:email] = email
  end

  def email
    fetch(:email)
  end
end