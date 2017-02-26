class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :checklist, foreign_key: true
      t.string :name
      t.string :description
      t.string :complete,      default: 'no'

      t.timestamps
    end
  end
end
