const express = require('express')
const app = express()
const port = 3000

const { Sequelize } = require("sequelize-cockroachdb");
const sequelize = new Sequelize(process.env.DATABASE_URL);



// Relations 


app.get('/', (req, res) => res.send('Hello World!'))



app.listen(port, async () => {
    console.log(`The server is started at port : ${post}`)
    await sequelize.sync( {force : true}  )
    console.log("Data Synced")
} )