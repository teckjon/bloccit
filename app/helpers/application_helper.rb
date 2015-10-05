module ApplicationHelper
   def form_group_tag(errors, &block)

     if errors.any?
       content_tag :div, capture(&block), class: 'form-group has-error'
     else
       content_tag :div, capture(&block), class: 'form-group'
     end
   end 
   
   def render_posts_title(posts)
       if posts.any? 
        output =  "<h2>Posts</h2>"
       else
        output = "<p>This user has not submitted any posts yet</p>"
       end
       output.html_safe 
   end
   
   def render_comments_title(comments)
       if comments.any?
           coutput = "<h2>Comments</h2>"
       else
           coutput = "<p>This user has not submitted any comments yet</p>"
       end
       coutput.html_safe
   end       
   
   def render_favorite_title(favorites)
       if favorites.any?
           foutput = "<h2>Favorites</h2>"
       else 
           foutput = "<p>This user does not have any favorites</p>"
       end
       foutput.html_safe
   end   
end
