const express=require("express");
const web3 = require("web3");
const ethjs = require("ethjs");
const app = express();

app.use(express.static("./"));

// app.get("/",function(req,res){
// 	res.sendFile(__dirname+"/index_ethjs.html");
// 	res.sendFile(__dirname+"/node_modules/web3/dist/web3.min.js")
// 	res.sendFile(__dirname+"/node_modules/ethjs/dist/ethjs.js")
// });

app.listen(8080,function(){console.log("listening on port 8080");});
