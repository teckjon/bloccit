class Post < ActiveRecord::Base
    has_many :comments
    
    def censored_title
        self.id % 5 == 0 ? "CENSORED" : self.title
    end
end
