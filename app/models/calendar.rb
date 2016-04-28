class Calendar < ActiveRecord::Base

  belongs_to :user

  include AASM

  aasm whiny_transitions: false do
    state :green, initial: true
    state :black
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

  end




end
