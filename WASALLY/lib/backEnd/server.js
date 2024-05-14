const MONGOOSE = require("mongoose");
const APP = require("./wasally");

const DOTENV = require("dotenv");

// TO CONFIG THE ENVIRONMENT

DOTENV.config({ path: "./config.env" });

// CONNECT TO DATABASE

const URL = "mongodb://localhost:27017/wasallyDB";

MONGOOSE.connect(URL)
	.then(() => {
		console.log("Successfully connected to db 🥳 🥳 ");
	})
	.catch((error) => {
		console.error("Error connecting to database:", error);
	});

// INITHIATE SERVER

const PORT = 3000;
APP.listen(PORT,'172.20.10.6', () => {
	console.log(`Running on port 📞  ${PORT}`);
});
