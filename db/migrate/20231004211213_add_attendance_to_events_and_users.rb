class AddAttendanceToEventsAndUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :attendance, foreign_key: true
    add_reference :users, :attendance, foreign_key: true
  end
end
