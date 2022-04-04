module ApplicationHelper
  def gravatar_image
    email_address = current_user.present? ? current_user.email : ""
    hash = Digest::MD5.hexdigest(current_user.email)
    image_tag("https://www.gravatar.com/avatar/#{hash}", :class => "h-8 w-8 rounded-full")
  end
end
