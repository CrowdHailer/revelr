require_relative '../test_config'

class PartyTest < UnitTest
  def test_stores_ticket_price
    party = Party.new ticket_price: Money.new(1200, 'bhd')
    assert_equal({ticket_fractional: 1200, ticket_currency: 'bhd'}, party)
  end

  def test_party_fetches_ticket_price
    party = Party.new ticket_fractional: 1200, ticket_currency: 'bhd'
    assert_equal Money.new(1200, 'bhd'), party.ticket_price
  end
end