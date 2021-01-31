# Surveys

## Api
### Surveys list
#### Path
```http
  GET /api/v1/surveys
```

### Create survey
#### Path
```http
  POTS /api/v1/surveys
```

#### Params
```javascript
{
  answers: [
    {
      title: string
      description: string
    }
  ]
  questions: [
    {
      title: string
    }
  ]
  options: [
    {
      title: string
      weight: float
      answer_index: int //0..answers.length - 1
      question_index: int //0..question.length - 1
    }
  ]
}
```

### Edit survey
#### Path
```http
  PUT/PUTCH /api/v1/surveys/:id
```

#### Params
```javascript
{
  answers: [
    {
      title: string
      description: string
    }
    {
      id[optional]: int
      title: string
      description: string
    }
  ]
  questions: [
    {
      title: string
    }
    {
      id: int
      title: string
    }
  ]
  options: [
    {
      title: string
      weight: float
      answer_index: int //0..answers.length - 1
      question_index: int //0..question.length - 1
    }
    {
      id[optional]: int
      title: string
      weight: float
      answer_id[optional]: int
      question_id[optional]: int
      answer_index[optional]: int //0..answers.length - 1
      question_index[optional]: int //0..question.length - 1
    }
  ]
}
```

### Delete survey
#### Path
```http
  DELETE /api/v1/surveys/:id
```
