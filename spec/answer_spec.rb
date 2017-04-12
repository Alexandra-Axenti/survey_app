require('spec_helper')

describe(Answer) do
  describe('question') do
    it("belongs to one question only") do
      test_question = Question.create({:name => "Name1"})
      test_answer = Answer.create({:description => "Answer1", :question_id => test_question.id()})
      expect(test_answer.question()).to(eq(test_question))
    end
  end

  it("validates presence of description") do
    test_answer = Answer.create({:description => ""})
    expect(test_answer.save()).to(eq(false))
  end
end
