module ApplicationHelper
    def current_user
        User.includes(:posts, :followers, :followed).find_by(id: session["user_id"])
    end

    def signed_in
        !current_user.nil?
    end
end
