class AddDurationToCommunicationRecord < ActiveRecord::Migration
  def change
  	add_column :communication_records, :duration, :time
  end
end
