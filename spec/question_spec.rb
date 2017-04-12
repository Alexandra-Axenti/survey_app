require('spec_helper')

describe(Question) do
  describe('survey') do
    it("belongs to one survey only") do
      test_survey = Survey.create({:title => "Survey1"})
      test_question = Question.create({:name => "Question1", :survey_id => test_survey.id()})
      expect(test_question.survey()).to(eq(test_survey))
    end
  end

  describe('answers') do
    it("has many answers") do
      test_question = Question.create({:name => "Question1", :survey_id => nil})
      test_answer1 = Answer.create({:description => "Answer1", :question_id => test_question.id()})
      test_answer2 = Answer.create({:description => "Answer2", :question_id => test_question.id()})
      expect(test_question.answers()).to(eq([test_answer1,test_answer2]))
    end
  end

  it("validates presence of name") do
    test_question = Question.create({:name => ""})
    expect(test_question.save()).to(eq(false))
  end

end
