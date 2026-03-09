const express = require("express")

const router = new express.Router()

/* Home Route */
router.get("/", function(req, res){
    res.render("index")
})

module.exports = router