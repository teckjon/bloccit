require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:Answer) { Answer.create!(body: "New Post Body")}
  let(:Question) { Question.create!(body: "Question body", Answer: Answer)}
    
    describe "attributes" do
       
        it "should respond to body" do
            expect(Question).to respond_to(:body)
        end
    end
end
