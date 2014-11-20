class Owner < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def name=(name)
    self[:name] = name
  end

  def name
    fetch(:name)
  end
end

class Account < Sequel::Model(:accounts)
  def initialize(*args, &block)
    super
    self.guid = SecureRandom.uuid()
  end

  def owner=(owner)
    set owner
  end

  def work_contact_point=(contact_point)
    nu_hash = Hash[contact_point.map {|k, v| ["work_#{k}", v] }]
    set nu_hash
  end

  def self.get_all_work_contacts
    all.map do |raw| 
      details = {
        telephone: raw.work_telephone,
        email: raw.work_email
      }
      ContactPoint.new details
    end
  end

end