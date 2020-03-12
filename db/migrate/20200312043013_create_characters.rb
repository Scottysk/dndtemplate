class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :race
      t.string :class
      t.integer :user_id
    end
  end
end

