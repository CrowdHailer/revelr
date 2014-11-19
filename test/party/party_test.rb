require_relative '../test_config'

class PartyTest < UnitTest
  def test_stores_ticket_price
    party = Party.new ticket_price: Money.new(1200, 'bhd')
    assert_equal({ticket_fractional: 1200, ticket_currency: 'bhd'}, party)
  end
end