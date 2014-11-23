class Owner < Thyng
  value_accessor :name
  value_accessor :guid
  value_accessor :work_location
  value_accessor :home_location
end

module Compounds
  def compound(item, options={})
    define_method "#{item}=", ->(thyng) {
      set self.class.prefix_hash(thyng, options[:prefix])
    }

    define_method item, -> {
      nu = Hash[values.select{|k,v| k.to_s.split('_')[0] == options[:prefix] }.map { |k, v| [k.to_s.sub(/^[^_]*_/,''),v] }]
      options[:class].new nu
    }
  end

  def prefix_hash(hash, prefix)
    Hash[hash.map {|k, v| ["#{prefix}_#{k}", v] }]
  end
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

    extend Compounds
    compound :work_location, prefix: 'work', class: ContactPoint
    compound :home_location, prefix: 'home', class: ContactPoint

    def owner
      Owner.new(name: name, work_location: work_location, home_location: home_location)
    end

    def self.last_owner
      last.owner
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