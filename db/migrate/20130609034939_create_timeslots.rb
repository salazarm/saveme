class CreateTimeslots < ActiveRecord::Migration
  def change
    create_table :timeslots do |t|
      t.integer  :schedule_id
      t.integer  :day
      t.string   :start_time
      t.string   :end_time

      t.timestamps
    end
  end
end
