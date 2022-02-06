class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :full_name       ,null: false  ,limit: 71 ,index: true
      t.string :nickname        ,null: false  ,limit: 50 ,index: { unique: true, name: 'unique_nicknames' }
      t.string :email           ,null: false  ,limit: 255 ,index: { unique: true, name: 'unique_emails' }
      t.string :password_digest ,null: false

      t.timestamps
    end
  end
end
