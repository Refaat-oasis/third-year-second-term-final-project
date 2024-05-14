const DRIVER_MODEL = require("../models/driverModel");
const MONGOOSE = require("mongoose");
const BCRYPT = require("bcrypt");

let getAllDrivers = async (req, res) => {
	try {
		let allDrivers = await DRIVER_MODEL.find();

		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			numberOfRivers: allDrivers.length,
			data: allDrivers,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let getDriverByID = async (req, res) => {
	try {
		const ID = req.params.driverId;
		const driver = await DRIVER_MODEL.findById(ID);
		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: driver,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let addNewDriver = async (req, res) => {
	try {
		let newDriver = await DRIVER_MODEL.create(req.body);
		res.status(201).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: newDriver,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let UpdateDriver = async (req, res) => {
	try {
		const ID = req.params.driverId;
		let updatedDriver = await DRIVER_MODEL.findByIdAndUpdate(ID, req.body, {
			new: true,
			runValidators: false,
		});
		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: updatedDriver,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let deleteDriver = async (req, res) => {
	try {
		const ID = req.params.driverId;
		let driver = await DRIVER_MODEL.findByIdAndDelete(ID);
		res.status(204).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: null,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let authenticateDriver = async (req, res) => {
	try {
		const { email, password } = req.body;

		let foundDriver = await DRIVER_MODEL.findOne({ email });

		if (!foundDriver) {
			return res.status(400).json({
				status: "fail",
				requestedAt: req.requestTime,
				message: "email not found",
			});
		}

		const passwordMatch = await BCRYPT.compare(password, foundDriver.password);

		if (!passwordMatch) {
			return res.status(401).json({
				status: "fail",
				requestedAt: req.requestTime,
				message: "Incorrect password",
			});
		}

		res.status(200).json({
			status: "success",
			requestedAt: req.requestTime,
			data: foundDriver,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

module.exports = {
	getAllDrivers,
	getDriverByID,
	UpdateDriver,
	deleteDriver,
	addNewDriver,
	authenticateDriver,
};
