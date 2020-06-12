class City < ApplicationRecord
  def time
    Time.zone = name
    return Time.zone.now
  end

  def timeBase12
    time.strftime "%I:%M %p"
  end

  def timeBase24
    time.strftime '%H:%M'
  end

  def isBusinessTime
    hour = Time.zone.now.hour
    return hour.between?(9,17)
  end

  def isBusinessOverTime
    hour = Time.zone.now.hour
    return hour.between?(18,19)
  end

  def isPersonalTime
    hour = Time.zone.now.hour
    return hour == 8 || hour.between?(20,22)
  end

  def dayType
    if isToday
      return "Today"
    elsif isTomorrow
      return "Tomorrow"
    elsif isYesterday
      return "Yesterday"
    end
  end

  def isToday
    Time.zone = "Melbourne"
    curDay = Time.zone.now.day

    Time.zone = name
    day = Time.zone.now.day
    return day == curDay
  end

  def isTomorrow
    Time.zone = "Melbourne"
    curDay = Time.zone.now.day

    Time.zone = name
    day = Time.zone.now.day
    return day == curDay+1
  end

  def isYesterday
    Time.zone = "Melbourne"
    curDay = Time.zone.now.day

    Time.zone = name
    day = Time.zone.now.day
    return day == curDay-1
  end

  def differTime
    Time.zone = name
    hour =     Time.zone.now.utc_offset() / 60 / 60 - 10

    return hour > 0 ? "+" + hour.to_s + "h" : hour.to_s + "h"
  end

end
