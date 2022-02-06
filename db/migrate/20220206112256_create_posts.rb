class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string      :content  ,null: false  ,limit: 140
      t.references  :user     ,null: false  ,foreign_key: true  ,type: :uuid

      t.timestamps
    end
  end
end
