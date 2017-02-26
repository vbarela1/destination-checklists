class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.belongs_to :destination
      t.timestamps
    end
  end
end
