 class Api::V1::UsersController < Api::V1::BaseController
   before_filter :authenticate_user
   before_filter :authorize_user
 
   def show
     user = User.find(params[:id])
 # #17
     render json: user.to_json, status: 200
   end
 
   def index
     users = User.all
 # #18
     render json: users.to_json, status: 200
   end
 
   def update
     user = User.find(params[:id])
 
 # #9
     if user.update_attributes(user_params)
       render json: user.to_json, status: 200
     else
       render json: {error: "User update failed", status: 400}, status: 400
     end       
   end
 
   def create
     user = User.new(user_params)
 
 # #14
     if user.valid?
       user.save!
       render json: user.to_json, status: 201
     else
       render json: {error: "User is invalid", status: 400}, status: 400
     end       
   end   
 
   private
 # #10
   def user_params
     params.require(:user).permit(:name, :email, :password, :role)
   end 
 end