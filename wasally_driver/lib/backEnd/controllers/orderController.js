const ORDER_MODEL = require("../models/orderModel");
const MONGOOSE = require("mongoose");


let getAllOrders = async (req, res) => {
	try {
		let queryObject = { ...req.query };
		let excludedFields = ["page", "sort", "limit", "field"];
		excludedFields.forEach((element) => {
			delete queryObject[element];
		});

		let query = ORDER_MODEL.find(queryObject);
		let allOrders = await query;

		res.status(200).json({
			status: "Success",
			requestedAt: req.requestTime,
			numberOfOrders: allOrders.length,
			data: allOrders,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let addNewOrder = async (req, res) => {
	try {
		let newOrder = await ORDER_MODEL.create(req.body);
		res.status(201).json({
			status: "Success",
			requestedAt: req.requestTime,
			data: newOrder,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let getOrderById = async (req, res) => {
	try {
		const ID = req.params.orderId;
		let order = await ORDER_MODEL.findById(ID);
		res.status(200).json({
			status: "success",
			requestedAt: req.requestTime,
			data: order,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};

let updateOrder = async (req, res) => {
	try {
		const ID = req.params.orderId;
		let updatedOrder = await ORDER_MODEL.findByIdAndUpdate(ID, req.body, {
			new: true,
			runValidators: false,
		});
		res.status(200).json({
			status: "success",
			requestedAt: req.requestTime,
			data: updatedOrder,
		});
	} catch (error) {
		res.status(400).json({
			status: "fail",
			message: `the error is 🔥   :-  ${error}`,
		});
	}
};
let deleteOrder = async (req, res) => {
	try {
		const ID = req.params.orderId;
		let order = await ORDER_MODEL.findByIdAndDelete(ID);
		res.status(204).json({
			status: "success",
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
module.exports = {
	getAllOrders,
	addNewOrder,
	getOrderById,
	updateOrder,
	deleteOrder,
	//	getAllOrdersForDriver,
};
