class Party < Hash
  def initialize(args={})
    args.each{ |attribute, value|
      send("#{attribute}=", value)
    }
  end

  def ticket_price=(amount)
    self.ticket_fractional = amount.fractional
    self.ticket_currency = amount.currency
  end

  def ticket_price
    Money.new(ticket_fractional, ticket_currency)
  end

  private

  def ticket_fractional=(fractional)
    self[:ticket_fractional] = fractional
  end

  def ticket_currency=(currency)
    self[:ticket_currency] = currency
  end

  def ticket_fractional
    fetch :ticket_fractional
  end

  def ticket_currency
    fetch :ticket_currency
  end
end