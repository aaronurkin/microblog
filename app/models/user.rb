class User < ApplicationRecord
    has_many :posts

    has_many :followed          ,foreign_key: :follower_id  ,class_name: "UserFollower"
    has_many :followed_users    ,through: :followed

    has_many :followers         ,foreign_key: :user_id      ,class_name: "UserFollower"
    has_many :following_users   ,through: :followers
end
