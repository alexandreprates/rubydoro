# encoding: utf-8

module Rubydoro
  module_function

  def start
    if Daemon.running?
      puts "Already running"
    else
      Daemon.run { Pomodoro.new.run } 
      # Pomodoro.new.run
    end
  end

  def stop
    Daemon.stop
  end

end
