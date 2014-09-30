express = require 'express'
app = express()

app.use (req, res, next) ->
    console.log "Time: " + Date.now()
    console.log "Request Url: " + req.originalUrl
    console.log "Request Type: " + req.method
    next()

app.get '/', (req, res, next)->
    res.send 'hello world!'
    next()

app.listen 3000
