import React, { useEffect } from 'react';

const SurveyForm = () => {

  useEffect(() => {
    const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

    const answers = [{title: 'apiansw1', description: 'api'}, {title: 'answ2', description: 'api'}]
    const questions = [{title: 'q1'}, {title: 'q2'}]
    const options = [{title: 'op1', weight: 12, answer_index: 0, question_index: 0}, {title: 'op2', weight: 212, answer_index: 1, question_index: 1}]
    const requestOptions = {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': csrf },
      body: JSON.stringify({ title: 'surv api', questions_params: questions, answers_params: answers, options_params: options })
    };

    fetch('/api/v1/surveys', requestOptions)

    const answers2 = [{id: 31, title: 'new apiansw1', description: 'api'}, {title: 'answ2', description: 'api'}]
    const questions2 = [{id: 28, title: 'new q1'}, {title: 'q2'}]
    const options2 = [{id: 24, title: 'new op1', weight: 12, answer_index: 0, question_index: 0}, {title: 'op2', weight: 212, answer_index: 1, question_index: 1}]
    const requestOptions2 = {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json', 'X-CSRF-Token': csrf },
      body: JSON.stringify({ title: 'updated by api', questions_params: questions2, answers_params: answers2, options_params: options2 })
    };

    fetch('/api/v1/surveys/1', requestOptions2)
  }, [])

  return (
    <form action="/surveys/" method="POST" className="survey-form">
    <input name="title" />

    <div className="survey-form__answers">

    </div>

    <div className="survey-form__options">

    </div>

    <button type="submit">Отправить</button>
  </form>
  )
}

export default SurveyForm;