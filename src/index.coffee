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
kittySchema.methods.speak = ->
  greeting =
    if @name
      "Meow name is #{@name}."
    else
      "I don't have a name."

Kitten = mongoose.model 'Kitten', kittySchema
silence = new Kitten name: 'Silence'
console.log silence.name
console.log silence.speak()

fluffy = new Kitten name: 'fluffy'

fluffy.save (error, fluffy) ->
  if error
    console.error error
  else
    Kitten.find
      name: /^fluff/
      (error, kittens) ->
        console.log(kittens)

app.set 'view engine', 'pug'

app.get '/', (request, response) ->
  response.render 'index',
    title: 'Some title'
    message: 'Some message.'

app.listen port
