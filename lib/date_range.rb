class DateRange < Thyng
  def initialize(start, finish)
    self.start_datetime = start
    self.finish_datetime = finish
  end

  aspect_accessor :start_datetime
  aspect_accessor :finish_datetime
end