class CreateMessasges < ActiveRecord::Migration
  def change
    create_table :messasges do |t|
      t.integer :videoconference_id
      t.integer :person_id
      t.text :content

      t.timestamps
    end
  end
end
