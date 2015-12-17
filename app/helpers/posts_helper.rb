module PostsHelper

  def toggle_like_button(post)
    user = User.first
    if user.flagged?(post, :like)
      link_to 'Unlike', like_post_path(post), class: 'btn btn-default'
    else
      link_to 'Like', like_post_path(post), class: 'btn btn-default'
    end
  end

end
