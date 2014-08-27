module Mensurable

  def seconds
    self
  end
  alias_method :second, :seconds

  def minutes
    self * 60.seconds
  end
  alias_method :minute, :minutes

  def hours
    self * 60.minutes
  end
  alias_method :hour, :hours

  def days
    self * 24.hours
  end
  alias_method :day, :days

  def weeks
    self * 7.days
  end
  alias_method :week, :weeks

  def months
    self * 30.days
  end
  alias_method :month, :months

  def years
    self * 365.days
  end
  alias_method :year, :years

end
Fixnum.send :include, Mensurable