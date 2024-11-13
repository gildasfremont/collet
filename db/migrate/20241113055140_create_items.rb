class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
