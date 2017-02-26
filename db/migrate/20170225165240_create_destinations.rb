class CreateDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :destinations do |t|
      t.belongs_to :traveler
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
