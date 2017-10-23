mongoose = require 'mongoose'
express = require 'express'
app = express()

uri = process.env.DB_URI
port = process.env.PORT || 3000

mongoose.connect uri

db = mongoose.connection
db.on 'error', console.error.bind(console, 'connection error:')
db.on 'open', ->
  "Connected to #{uri}"

{ Schema } = require 'mongoose'
kittySchema = Schema name: String
Kitten = mongoose.model 'Kitten', kittySchema
silence = new Kitten name: 'Silence'
console.log silence.name

app.set 'view engine', 'pug'

app.get '/', (request, response) ->
  response.render 'index',
    title: 'Some title'
    message: 'Some message.'

app.listen port
