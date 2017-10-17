express = require 'express'
app = express()

app.set 'view engine', 'pug'

app.get '/', (request, response) ->
  response.render 'index',
    title: 'Some title'
    message: 'Some message.'

app.listen 3000
