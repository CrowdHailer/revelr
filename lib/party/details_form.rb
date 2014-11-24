class Party < Thyng
  class DetailsForm
    include Virtus.model

    attribute :start_datetime, DateTime, :reader => :private 
    attribute :finish_datetime, DateTime, :reader => :private 
    attribute :timetable

    def timetable
      DateRange.new start_datetime, finish_datetime
    end
  end
end