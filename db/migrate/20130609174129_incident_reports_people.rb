class IncidentReportsPeople < ActiveRecord::Migration
	def change
		create_table :incident_reports_people, :id => false do |t|
  		t.integer :person_id
  		t.integer :incident_report_id
  	end
	end
end
