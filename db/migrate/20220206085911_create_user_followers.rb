class CreateUserFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_followers, primary_key: [:user_id, :follower_id] do |t|
      t.uuid  :user_id      ,null: false
      t.uuid  :follower_id  ,null: false
      t.date  :followed_at  ,null: false  ,default: -> { 'now()' }
    end
    add_foreign_key :user_followers, :users, column: :user_id
    add_foreign_key :user_followers, :users, column: :follower_id
  end
end
