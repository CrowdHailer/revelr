class Owner < Thyng
  value_accessor :name
  value_accessor :guid
end

class Owner
  class Record < Sequel::Model(:owners)
    def initialize(*args, &block)
      super
      self.guid = SecureRandom.uuid()
    end

    def self.save owner
      record = new.set(owner).save
      owner.guid = record.guid
    end
  end
end

# class Account < Sequel::Model(:accounts)
  # def initialize(*args, &block)
  #   super
  #   self.guid = SecureRandom.uuid()
  # end

#   def owner=(owner)
#     set owner
#   end

#   def work_contact_point=(contact_point)
#     nu_hash = Hash[contact_point.map {|k, v| ["work_#{k}", v] }]
#     set nu_hash
#   end

#   def owner
#     Owner.new(name: name, work_contact_point: work_contact_point)
#   end

#   def work_contact_point
#     ContactPoint.new(email: work_email, telephone: work_telephone)
#   end

#   def self.get_all_work_contacts
#     all.map(&:work_contact_point)
#   end

#   def self.last_owner
#     last.owner
#   end

# end