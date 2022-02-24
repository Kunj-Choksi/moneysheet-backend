class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  def render_result_json(object)
    obj = {
      status: 'success',
      contents: object
    }
    render json: obj
  end

  def render_result_message(message)
    obj = {
      status: 'success',
      message: message
    }
    render json: obj
  end

  def render_error_message(message)
    obj = {
      status: 'error',
      message: message
    }
    render json: obj
  end

  def encode_token(payload)
    JWT.encode(payload, MY_SECRET)
  end

  def session_user
    decoded_hash = decode_token
    if decoded_hash && decoded_hash.empty?
      nil
    else
      user_google_id = decoded_hash[0]['google_uid']
      @user = User.where(google_uid: user_google_id).first
    end
  end

  def auth_header
    request.headers['Authorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, MY_SECRET, true, algorithm: 'HS256')
      rescue => error
        []
      end
    end
  end
end
