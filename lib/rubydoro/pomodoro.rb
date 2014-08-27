#encoding: utf-8

module Rubydoro
  class Pomodoro
    attr_reader :worktime, :resttime, :statusfile

    def initialize()
      @worktime = Time.new(0) + 15.minutes
      @resttime = Time.new(0) + 5.minutes
      @statusfile = File.expand_path('../../../log/rubydoro.status', __FILE__)
    end

    def run
      wait worktime, " 🍅 pomodoro"
      wait resttime, " 🏁 rest time", false
      report " 😛 "
    end

    private

    def report(message)
      File.open(statusfile, 'w') { |f| f.write message }
    end

    def wait(time, message, tick = true)
      %x{notify-send "Beginning #{message}"}
      while time.to_i > -62167208012 do 
        play_tick if tick
        report("#{message}: #{time.strftime('%Mm%Ss')}")
        time = time - 1
        sleep 1
      end  
    end

    def play_tick
      @audiofile ||= File.expand_path('../../../resources/tick.mp3', __FILE__)
      %x{play #{@audiofile} > /dev/null &}
    end

  end
end
