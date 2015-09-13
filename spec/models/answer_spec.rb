require 'rails_helper'

RSpec.describe Answer, type: :model do
    let(:answer) { answer.create!(body: "New Post Body")}
    let(:question) { question.create!(body: "Question body", answer: answer)}
    
    describe "attributes" do
       
        it "should respond to body" do
            expect(Question).to respond_to(:body)
        end
    end
end
