module PostsHelper
    
    def render_censored_title(post)
        output = post.title
        if post.id % 5 == 0 
           output = "<strong>#{post.censored_title}</strong>"
       end
       output.html_safe
    end
end
