class ApplicationController < ActionController::Base
    before_action :set_default_user

    def set_default_user
      if user_signed_in? && current_user.confirmed_at?
        default_url_options[:user_id] = current_user.id
      end
    end
end
