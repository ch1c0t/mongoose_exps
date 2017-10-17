mongoose = require 'mongoose'
express = require 'express'
app = express()

uri = process.env.MONGOLAB_URI || process.env.MONGOHQ_URL || 'mongodb://localhost/for_mongoose'
port = process.env.PORT || 3000

mongoose.connect uri, (error, response) ->
  if error
    console.log "An error occured while connecting to #{uri}: #{error}"
  else
    console.log "Successfully connected to #{uri}."

app.set 'view engine', 'pug'

app.get '/', (request, response) ->
  response.render 'index',
    title: 'Some title'
    message: 'Some message.'

app.listen (process.env.PORT || 3000)
