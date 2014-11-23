require './lib/thyng/thyng'

class ContactPoint < Thyng
  value_accessor :telephone
  value_accessor :email
end
