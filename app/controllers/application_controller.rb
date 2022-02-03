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
end
