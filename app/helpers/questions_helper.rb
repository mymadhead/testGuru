module QuestionsHelper
  def question_header(question)
    if @question.persisted?
      "Edit: #{question.test.title} question"
    else
      "Create New #{question.test} question"
    end
  end
end
