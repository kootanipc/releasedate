class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name
      t.text :content
      t.date :date
      t.boolean :pass
      t.date :display
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
