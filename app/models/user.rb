class User < ActiveRecord::Base
   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
   has_many :favorites, dependent: :destroy   
    before_save { self.email = email.downcase }
    before_save { self.role ||= :member }
    before_create :generate_auth_token    
 # #3
   EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

 # #4
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #5
   validates :password, presence: true, length: { minimum: 6 }
 # #6
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 100 },
             format: { with: EMAIL_REGEX }

 # #7
   has_secure_password
   enum role: [:member, :admin]   

   def favorite_for(post)
     favorites.where(post_id: post.id).first
   end   
 
   def self.avatar_url(user, size)
     gravatar_id = Digest::MD5::hexdigest(user.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end   
    
 # #3
   def generate_auth_token
     loop do
       self.auth_token = SecureRandom.base64(64)
       break unless User.find_by(auth_token: auth_token)
     end
   end
end
