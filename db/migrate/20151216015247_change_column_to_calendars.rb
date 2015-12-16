class ChangeColumnToCalendars < ActiveRecord::Migration

  def self.up
     change_table :calendars do |t|
       t.change :start_time, :date
     end
   end
   def self.down
     change_table :calendars do |t|
       t.change :start_time, :datetime
     end
   end


end
