class CreateCommunicationRecord < ActiveRecord::Migration
  def change
    create_table :communication_records do |t|
      t.integer :rating
      t.string  :initiator_id
      t.string  :responder_id
      t.timestamps
    end
  end
end
