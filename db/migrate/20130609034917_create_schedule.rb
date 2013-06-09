class CreateSchedule < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :person_id
      t.integer :timeslot_id

      t.timestamps
    end
  end
end
