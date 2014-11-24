class Party < Thyng
  class DetailsForm
    class Validator
      include Veto.validator
      validates :timetable, presence: true
    end
  end
end
