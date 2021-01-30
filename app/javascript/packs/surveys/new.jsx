import React from 'react'
import ReactDOM from 'react-dom'
import SurveyForm from '../../components/surveys/form'

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <SurveyForm />,
    document.body.appendChild(document.createElement('div')),
  )
})
