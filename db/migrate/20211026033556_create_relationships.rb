class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      # フォローするユーザ
      t.integer :follower_id
      # フォローされるユーザ
      t.integer :followed_id

      t.timestamps
    end
  end
end
