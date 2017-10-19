mongoose = require 'mongoose'
express = require 'express'
app = express()

uri = process.env.DB_URI || 'mongodb://localhost/for_mongoose'
port = process.env.PORT || 3000

mongoose.connect uri

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.on 'open', ->
  "Connected to #{uri}"

app.set 'view engine', 'pug'

app.get '/', (request, response) ->
  response.render 'index',
    title: 'Some title'
    message: 'Some message.'

app.listen port
