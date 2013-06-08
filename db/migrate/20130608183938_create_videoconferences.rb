class CreateVideoconferences < ActiveRecord::Migration
  def change
    create_table :videoconferences do |t|
      t.integer :saver
      t.integer :savee
      t.integer :savee_rating
      t.integer :saver_rating
      t.integer :savee_id
      t.integer :saver_id

      t.timestamps
    end
  end
end
