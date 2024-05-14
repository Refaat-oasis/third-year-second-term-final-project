const MONGOOSE = require("mongoose");

const ORDER_SCHEMA = new MONGOOSE.Schema({
	creationDate: {
		type: Date,
		default: Date.now(),
	},
	orderStatus: {
		type: String,
		default: "waiting",
		required: false,
	},
	dlelivaryMethod: {
		type: String,
		required: true,
		enum: ["car", "truck", "courier"],
	},
	orderPrice: {
		type: Number,
		required: false,
	},
	sourceCity: {
		type: String,
		required: true,
	},
	sourceStreet: {
		type: String,
		required: true,
	},
	sourceHouse: {
		type: String,
		required: false,
	},
	sourceFlat: {
		type: String,
		required: false,
	},
	sourceContactName: {
		type: String,
		required: true,
	},
	sourceContactPhone: {
		type: String,
		required: true,
		validate: {
			validator: function (value) {
				return /^[0-9]{11}$/.test(value);
			},
			message: (props) => `${props.value} is not a valid phone number!`,
		},
	},
	sourceContactAddress: {
		type: String,
		required: true,
	},
	destinationCity: {
		type: String,
		required: true,
	},
	destinationStreet: {
		type: String,
		required: true,
	},
	destinationHouse: {
		type: String,
		required: false,
	},
	destinationFlat: {
		type: String,
		required: false,
	},
	destinationContactName: {
		type: String,
		required: true,
	},
	destinationContactPhone: {
		type: String,
		required: true,
		validate: {
			validator: function (value) {
				return /^[0-9]{11}$/.test(value);
			},
			message: (props) => `${props.value} is not a valid phone number!`,
		},
	},
	destinationContactAddress: {
		type: String,
		required: true,
	},
	userID: {
		type: String,
		required: false,
	},
	driverID: {
		type: String,
		required: false,
	},
	driverIDMethod: {
		type: MONGOOSE.Schema.Types.ObjectId,
		ref: "Driver",
	},
});

const ORDER = MONGOOSE.model("OrderCollection", ORDER_SCHEMA);

module.exports = ORDER;
