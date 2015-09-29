module PostsHelper
   def user_is_authorized_for_post?(post)
        current_user && (current_user == post.user || current_user.admin?)
   end
   
    def render_censored_title(post)
        output = post.title
        if post.id % 5 == 0 
           output = "<strong>#{post.censored_title}</strong>"
        end
       output.html_safe
    end
end
