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

  def work_contact_point=(work_contact_point)
    self[:work_contact_point] = work_contact_point
  end

  def work_contact_point
    fetch(:work_contact_point)
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

  def owner
    Owner.new(name: name, work_contact_point: work_contact_point)
  end

  def work_contact_point
    ContactPoint.new(email: work_email, telephone: work_telephone)
  end

  def self.get_all_work_contacts
    all.map(&:work_contact_point)
  end

  def self.last_owner
    last.owner
  end

end