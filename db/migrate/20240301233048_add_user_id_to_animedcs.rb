class AddUserIdToAnimedcs < ActiveRecord::Migration[7.1]
  def change
    add_column :animedcs, :user_id, :integer
    add_index :animedcs, :user_id
  end
end
