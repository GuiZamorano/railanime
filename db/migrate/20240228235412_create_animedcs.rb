class CreateAnimedcs < ActiveRecord::Migration[7.1]
  def change
    create_table :animedcs do |t|
      t.string :anime_name
      t.string :authour
      t.boolean :watched
      t.integer :rating

      t.timestamps
    end
  end
end
