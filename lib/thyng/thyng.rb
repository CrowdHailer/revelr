class Thyng < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def self.value_accessor(attribute, options={})

    define_method attribute do
      if options.has_key? :initial
        fetch attribute do
          self[attribute] = options[:initial]
        end
      else
        fetch(attribute)
      end
    end

    define_method "#{attribute}=", ->(value) {
      self[attribute] = value
    }
  end
end

class Thyng < Hash
  module CryptedRecord
    def crypted_accessor(attribute)
      crypted_attribute = "crypted_#{attribute}".to_sym
      value_accessor crypted_attribute

      define_method attribute do
        BCrypt::Password.new send(crypted_attribute)
      end

      define_method "#{attribute}=", ->(value) {
        send "#{crypted_attribute}=", BCrypt::Password.create(value).to_s
      }

      define_method "check_#{attribute}", ->(test_value) {
        send(attribute) == test_value
      }
    end
  end
end