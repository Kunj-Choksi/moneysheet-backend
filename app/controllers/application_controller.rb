class ApplicationController < ActionController::Base

  def render_result_json object
    obj = {
      :status => "success",
      :contents => object
    }
    render json: obj
  end
end
