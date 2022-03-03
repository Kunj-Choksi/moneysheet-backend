class ClientController < ApplicationController

  def register_client
    client = Client.where(email: params[:email]).first

    unless client.present?
      client = Client.create(
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

  def verify_client
    client = Client.where(email: params[:email], google_uid: params[:google_uid]).first

    unless client.present?
      render_error_message('Client not found')
      return
    end

    map = {}
    map['token'] = encode_token({ email: params[:email], google_uid: params[:google_uid] })

    render_result_json map
  end
end
