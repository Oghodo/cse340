const express = require("express")

const app = express()

const PORT = process.env.PORT || 3000


/* View Engine */
app.set("view engine", "ejs")
app.set("views", "./views")


/* Static Files */
app.use(express.static("public"))


/* Routes */
const staticRoutes = require("./routes/static")

app.use("/", staticRoutes)


/* Server Listener */
app.listen(PORT, function(){
    console.log(`Server running on port ${PORT}`)
})