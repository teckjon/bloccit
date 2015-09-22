class SponsoredPostsController < ApplicationController
  def show
    @sponsored_posts = SponsoredPost.find(params[:id])
  end

  def new
    @sponsored_post = SponsoredPost.new    
  end

  def edit
    @sponsored_post = SponsoredPost.find(params[:id])
  end
  
  def create
    @sponsored_post = SponsoredPost.new
    @sponsored_post.name = params[:topic][:description]
    @sponsored_post.public = params[:topic][:public]
    
    if @sponsored_post.save
      redirect_to @sponsored_post, notice: "Sponsored Post was saved successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      render :new
    end  
  end
  
  def update
    @sponsored_post = SponsoredPost.find(params[:id])
    @sponsored_post.name = params[:topic][:description]
    @sponsored_post.public = params[:topic][:public]
    
    if @sponsored_post.save
      redirect_to @sponsored_post, notice: "Sponsored Post was updated."
    else
      flash[:error] = "Error saving topic. Please try again."
      render :edit
    end  
  end
  
  def destroy
     @sponsored_post = SponsoredPost.find(params[:id])
 
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the topic."
       render :show
     end
  end     
end

