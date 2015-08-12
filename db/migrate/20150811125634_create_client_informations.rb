class CreateClientInformations < ActiveRecord::Migration
  def change
    create_table :client_informations do |t|
      t.decimal :body_mass_index
      t.decimal :body_fat_percentage
      t.decimal :weight
      t.decimal :height
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
