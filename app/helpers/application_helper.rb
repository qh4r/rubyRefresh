module ApplicationHelper
  def gravatar_for(user, params = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{params[:size]}"
    image_tag(gravatar_url, :alt => user.username, class: 'img-circle')
  end
end
