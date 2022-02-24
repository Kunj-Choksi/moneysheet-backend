class UserController < ApplicationController

  def register_user
    user = User.where(email: params[:email]).first

    unless user.present?
      user = User.create(
        name: params[:name],
        email: params[:email],
        total_balance: 0.0,
        google_uid: params[:uid],
        google_photo_url: params[:photoURL]
      )
    end

    map = {}
    map['token'] = encode_token({ email: params[:email], google_uid: params[:uid] })

    render_result_json map
  end

  def verify_user
    user = User.where(email: params[:email], google_uid: params[:google_uid]).first

    unless user.present?
      render_error_message('User not found')
      return
    end

    map = {}
    map['token'] = encode_token({ email: params[:email], google_uid: params[:google_uid] })

    render_result_json map
  end
end
