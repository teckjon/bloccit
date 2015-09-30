class Post < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user   
    has_many :comments, dependent: :destroy
    has_many :labelings, as: :labelable
    has_many :labels, through: :labelings  
    
    default_scope { order('created_at DESC') } 
    #  scope :active, -> { where state: 'active' }
    scope :ordered_by_title, -> { order(:title) }
    scope :ordered_by_reverse_created_at, -> { order(:created_at) }
    scope :recent, -> { where("created_at < ?", 5.days)}
    
    # my_post = Post.ordered_by_title.ordered_by_reverse_created_at
    
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true    
    validates :user, presence: true    
    def censored_title
        self.id % 5 == 0 ? "CENSORED" : self.title
    end
end
