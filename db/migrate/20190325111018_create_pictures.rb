class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :attachment
      t.integer :user_id

    end
  end
end
