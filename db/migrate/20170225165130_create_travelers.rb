class CreateTravelers < ActiveRecord::Migration[5.0]
  def change
    create_table :travelers do |t|
      t.string :first_name
      t.string :last_name
      t.text :interests

      t.timestamps
    end
  end
end
