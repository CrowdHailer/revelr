class Party < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def ticket_price=(amount)
    self[:ticket_fractional] = amount.fractional
    self[:ticket_currency] = amount.currency
  end
end