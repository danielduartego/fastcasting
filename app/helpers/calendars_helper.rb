module CalendarsHelper

  def label_class(state)
    case state
    when "black"
      "black-status"
    when "green"
      "green-status"
    when "orange"
      "orange-status"
    when "red"
      "red-status"
    end
  end


end
