class AddAssStateToCalendars < ActiveRecord::Migration
  def change
    add_column :calendars, :aasm_state, :string
  end
end
