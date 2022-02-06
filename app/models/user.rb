class User < ApplicationRecord
    has_secure_password
    validates :full_name        ,presence: true
    validates :nickname, :email ,presence: true ,uniqueness: true

    has_many :posts

    has_many :followed          ,foreign_key: :follower_id  ,class_name: "UserFollower"
    has_many :followed_users    ,through: :followed

    has_many :followers         ,foreign_key: :user_id      ,class_name: "UserFollower"
    has_many :following_users   ,through: :followers
end
