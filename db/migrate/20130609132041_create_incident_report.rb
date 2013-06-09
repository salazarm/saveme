class CreateIncidentReport < ActiveRecord::Migration
  def change
    create_table :incident_reports do |t|
      t.float  :latitude
      t.float  :longitude
      t.string :description

      t.timestamps
    end
  end
end
