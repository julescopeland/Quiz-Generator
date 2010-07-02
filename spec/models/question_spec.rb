require 'spec_helper'

describe Question do
  before(:each) do
    @attr = {
      :question => "What is the answer to life, the universe and everything?",
      :answer => "42",
      :user_id => 1
    }
    @user = Factory(:user)
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@attr)
  end
  
  it "should require a question" do
    no_question = Question.new(@attr.merge(:question => ""))
    no_question.should_not be_valid
  end
  
  it "should require an answer" do
    no_answer = Question.new(@attr.merge(:answer => ""))
    no_answer.should_not be_valid
  end
  
  it "should not allow duplicate questions" do
    question_one = Question.create!(@attr)
    question_two = Question.new(@attr)
    question_two.should_not be_valid
  end
  
  describe "user associations" do
    before(:each) do
      @question = @user.questions.create(@attr)
    end
    
    it "should have a user attribute" do
      @question.should respond_to(:user)
    end
    
    it "should have the right user associated" do
      @question.user.should == @user
    end
  end
end
