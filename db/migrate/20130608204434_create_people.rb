class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :ip
      t.boolean :is_anon
      t.string :image

      t.timestamps
    end
  end
end
