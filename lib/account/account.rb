class Account < Sequel::Model(:accounts)
  def initialize(*args, &block)
    super
    self.guid = SecureRandom.uuid()
  end

  def update_work_contact_point! contact_point
    nu_hash = Hash[contact_point.map {|k, v| ["work_#{k}", v] }]
    update nu_hash
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