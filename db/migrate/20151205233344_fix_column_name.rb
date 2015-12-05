class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :calendars, :job, :name
  end
end
