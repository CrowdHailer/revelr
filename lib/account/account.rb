class Account < Sequel::Model(:accounts)
  def initialize(*args, &block)
    super
    self.guid = SecureRandom.uuid()
  end

  def update_work_contact_point! contact_point
    nu_hash = Hash[contact_point.map {|k, v| ["work_#{k}", v] }]
    update nu_hash
  end
end