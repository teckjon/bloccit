require 'rails_helper'

RSpec.describe Answer, type: :model do

    let(:question) { Question.create!(body: "Question body", title: "This is my title")}
    let(:answer) { Answer.create!(body: "New Post Body", question: question)}
    
    describe "attributes" do
       
        it "should respond to body" do
            expect(answer).to respond_to(:body)
        end
    end
end
