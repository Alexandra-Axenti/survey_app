require('spec_helper')

describe(Survey) do
  describe('questions') do
    it("has many questions") do
      test_survey = Survey.create({:title => "Survey1"})
      test_question1 = Question.create({:name => "Question1", :survey_id => test_survey.id()})
      test_question2 = Question.create({:name => "Question2", :survey_id => test_survey.id()})
      expect(test_survey.questions()).to(eq([test_question1,test_question2]))
    end
  end

  it("validates presence of title") do
    test_survey = Survey.create({:title => ""})
    expect(test_survey.save()).to(eq(false))
  end

  it("capitalizes each word in the survey title") do
    test_survey = Survey.create({:title => "this is a survey"})
    expect(test_survey.title()).to(eq("This Is A Survey"))
  end
end
