class AddTokenToConference < ActiveRecord::Migration
  def change
  	add_column :videoconferences, :auth_token, :string
  end
end
