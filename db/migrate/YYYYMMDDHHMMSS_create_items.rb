class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end 