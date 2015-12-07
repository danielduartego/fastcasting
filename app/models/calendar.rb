class Calendar < ActiveRecord::Base

  belongs_to :user

  # before_action :authorize

  include AASM

  # we put all the states and transitions in the `aasm` block
  aasm whiny_transitions: false do
    state :black, initial: true
    state :green
    state :orange
    state :red


    event :available do
      transitions from: :black, to: :green
    end

    event :unavailable do
      transitions from: :green, to: :black
    end

    event :hold do
      transitions from: :green, to: :orange
    end

    event :booked do
      transitions from: :orange, to: :red
    end

    event :unbooked do
      transitions from: :red, to: :green
    end

    # def authorize
    #   redirect_to root_path, alert: "Access denied!" unless can? :manage, @calendar
    # end


  end


end
