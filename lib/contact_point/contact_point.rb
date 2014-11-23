class Thyng < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def self.value_accessor(attribute)
    define_method attribute do
      fetch(attribute)
    end

    define_method "#{attribute}=", ->(value) {
      self[attribute] = value
    }

  end
end

class ContactPoint < Thyng
  value_accessor :telephone

  def email=(email)
    self[:email] = email
  end

  def email
    fetch(:email)
  end
end