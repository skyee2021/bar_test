class AddDeteledAt < ActiveRecord::Migration[6.1]
  def change
    add_column :bars, :deleted_at, :datetime
    #加入時間戳記紀錄刪除時間
    add_index :bars, :dateted_at
    #索引查詢
  end
end
