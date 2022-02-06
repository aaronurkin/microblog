class ApplicationController < ActionController::Base
    include ApplicationHelper

    protect_from_forgery with: :exception

    before_action :authorized
    helper_method :current_user
    helper_method :signed_in?

    def authorized
        redirect_to "/signin" unless signed_in
    end
end
