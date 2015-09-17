class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    
    def censored_title
        self.id % 5 == 0 ? "CENSORED" : self.title
    end
end
