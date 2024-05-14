const EXPRESS = require("express");

const MORGAN = require("morgan");

const USER_ROUTERS = require("./routers/userRouters");
const CHAT_ROUTERS = require("./routers/chatRouters");
const DRIVER_ROUTERS = require("./routers/driverRouts");
const ORDER_ROUTERS = require("./routers/orderRouter");

const APP = EXPRESS();

// KNOW THE INVIRONMENT YOU ARE WORKING IN

if (process.env.NODE_ENV == "development") {
	APP.use(MORGAN("dev"));
}

// MIDDLEWARE FOR PASRSING JSON

APP.use(EXPRESS.json());

// KNOW REQUEST TIME

APP.use((req, res, next) => {
	req.requestTime = new Date().toISOString();
	console.log(`requested at :-  ${req.requestTime}`);
	next();
});

APP.use((req, res, next) => {
	console.log("hello grom the  🥇   middleware 👋");
	next();
});

// TALK TO ROUTES

APP.use("/api/v1/chat", CHAT_ROUTERS);
APP.use("/api/v1/user", USER_ROUTERS);
APP.use("/api/v1/driver", DRIVER_ROUTERS);
APP.use("/api/v1/order", ORDER_ROUTERS);

module.exports = APP;
