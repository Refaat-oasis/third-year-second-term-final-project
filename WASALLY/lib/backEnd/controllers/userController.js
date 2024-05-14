const USER_MODEL = require("../models/userModel");
const MONGOOSE = require("mongoose");
const BCRYPT = require("bcrypt");

let getAllUsers = async (req, res) => {
	try {
		let allUsers = await USER_MODEL.find(req.query);
		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			numberOfUsers: allUsers.length,
			data: allUsers,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let getUserByID = async (req, res) => {
	try {
		const ID = req.params.userID;
		let user = await USER_MODEL.findById(ID);
		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: user,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let addNewUser = async (req, res) => {
	try {
		let newUser = await USER_MODEL.create(req.body);
		res.status(201).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: newUser,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let updateUser = async (req, res) => {
	try {
		const ID = req.params.userID;
		let updatedUser = await USER_MODEL.findByIdAndUpdate(ID, req.body, {
			new: true,
			runValidators: false,
		});
		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: updatedUser,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let deleteUser = async (req, res) => {
	try {
		const ID = req.params.userID;
		let user = await USER_MODEL.findByIdAndDelete(ID);
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

let authenticateUser = async (req, res) => {
	try {
		const { email, password } = req.body;

		let foundUser = await USER_MODEL.findOne({ email });

		if (!foundUser) {
			return res.status(400).json({
				status: "fail",
				requestedAt: req.requestTime,
				message: "email not found",
			});
		}

		const passwordMatch = await BCRYPT.compare(password, foundUser.password);

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
			data: foundUser,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

module.exports = {
	getAllUsers,
	getUserByID,
	updateUser,
	deleteUser,
	addNewUser,
	authenticateUser,
};
