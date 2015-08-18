class AddUsersIdColumnToClientInformations < ActiveRecord::Migration
  def change
    add_column :client_informations, :user_id, :integer
  end
end
