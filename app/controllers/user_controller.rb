class UserController < ApplicationController
    
    def register_user
        user = User.where(email: params[:email]).first

        unless user.present?
            user = User.create(
                name: params[:name],
                email: params[:email],
                total_balance: 0.0,
                google_uid: params[:uid],
                google_photo_url: params[:photoURL],
            )
        end

        render_result_message "User registered"
    end
end
