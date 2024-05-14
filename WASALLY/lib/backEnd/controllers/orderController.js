const ORDER_MODEL = require("../models/orderModel");
const MONGOOSE = require("mongoose");

// const VehicleType = require('./models/VehicleType'); // assuming this is the path to your vehicle model

// const findVehiclesByType = async (type) => {
//   try {
//     const vehicles = await VehicleType.find({ type: type });
//     return vehicles;
//   } catch (error) {
//     console.error('Error finding vehicles by type:', error);
//     throw error;
//   }
// };

let getAllOrdersForDriver = async (driverID) => {
	try {
		const orders = await Order.find({
			driverIDMethod: driverID,
		}).populate("driverIDMethod", "vehicleMethod");
		const filteredOrders = orders.filter(
			(order) => order.driverIDMethod.vehicleMethod === "registeredMethod",
		); // replace 'registeredMethod' with the driver's registered vehicle method
		return filteredOrders;
	} catch (error) {
		console.error("Error getting orders for driver:", error);
		throw error;
	}
};

let getAllOrders = async (req, res) => {
	try {
		let allOrders = await ORDER_MODEL.find();
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
	getAllOrdersForDriver,
};
