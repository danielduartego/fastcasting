class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :job
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
