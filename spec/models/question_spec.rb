require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:Question) { Question.create!(title: "Question?", body: "New Post Body")}
  
  describe "attributes" do
      it "should respond to title" do
          expect(Question).to respond_to(:title)
      end
      
      it "should respond to body" do
          expect(Question).to respond_to(:body)
      end
  end      
end
