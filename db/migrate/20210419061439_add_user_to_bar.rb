class AddUserToBar < ActiveRecord::Migration[6.1]
  def change
    # add_column :bars, :user_id, :integer
    # add_index :bars, :user_id

    add_reference(:bars, :user)
    #加欄位打索引
  end
end
