SimpleCalendar::Calendar.class_eval do

  def td_classes_for(day)
    today = Time.zone.now.to_date

    td_class = ["day"]
    td_class << "wday-#{day.wday.to_s}"
    td_class << "today"         if today == day
    td_class << "past"          if today > day
    td_class << "future"        if today < day
    td_class << 'start-date'    if day.to_date == start_date.to_date
    td_class << "prev-month"    if start_date.month != day.month && day < start_date
    td_class << "next-month"    if start_date.month != day.month && day > start_date
    td_class << "current-month" if start_date.month == day.month
    td_class << "has-events"    if sorted_events.fetch(day, []).any?
    #td_class << "has-events-booked"    if sorted_events.fetch(day, []).any? && booked

    td_class
  end

  private

  def booked_events
    @calendars.each do |calendar|
      calendar.user
    end
  end

  def booked
    booked_events.user.bookings.where(accepted: true)
  end

end
