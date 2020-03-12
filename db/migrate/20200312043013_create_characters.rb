class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :title
      t.string :content
      t.integer :user_id
    end
  end
end

