class AddInCallColumnToPerson < ActiveRecord::Migration
  def change
    add_column :people, :in_call, :boolean
  end
end
