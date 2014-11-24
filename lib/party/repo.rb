class Party < Thyng
  class Repo
    class Record < Sequel::Model(:parties)
      def timetable=(timetable)
        set timetable
      end

      def party
        Party.new timetable: timetable
      end

      def timetable
        DateRange.new start_datetime, finish_datetime
      end
    end

    def self.save party
      Record.new.update(party)
    end

    def self.first
      Record.first.party
    end

    def self.all
      Record.all.map(&:party)
    end

  end
end