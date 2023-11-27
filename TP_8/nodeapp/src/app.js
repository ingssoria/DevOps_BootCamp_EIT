const express = require('express')
const app = express()
const port = 8080

app.get('/', (req, res) => {
  res.send('Wellcome to TP_8 App Engine!')
})

app.listen(port, () => {
  console.log(`TP_8 app listening on port ${port}`)
})