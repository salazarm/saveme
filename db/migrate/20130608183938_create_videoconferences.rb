class CreateVideoconferences < ActiveRecord::Migration
  def change
    create_table :videoconferences do |t|
      t.integer :saver
      t.integer :savee

      t.timestamps
    end
  end
end
