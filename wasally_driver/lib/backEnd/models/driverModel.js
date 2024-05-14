const MONGOOSE = require("mongoose");
const BCRYPT = require("bcrypt");

const DRIVER_SCHEMA = new MONGOOSE.Schema({
	name: {
		type: String,
		required: true,
	},
	email: {
		type: String,
		required: true,
		unique: true,
		validate: {
			validator: function (value) {
				return /^\S+@\S+\.\S+$/.test(value);
			},
			message: (props) => `${props.value} is not a valid email address!`,
		},
	},
	password: {
		type: String,
		required: true,
		minlength: 8,
		validate: {
			validator: function (value) {
				return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/.test(
					value,
				);
			},
			message: (props) =>
				`${props.value} is not a strong password! Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be at least 8 characters long.`,
		},
	},
	mobilePhone: {
		type: String,
		required: true,
		validate: {
			validator: function (value) {
				return /^[0-9]{11}$/.test(value);
			},
			message: (props) => `${props.value} is not a valid phone number!`,
		},
	},

	delivaryMethod: {
		type: String,
		required: true,
		enum: ["car", "truck", "courier"],
	},
	
});

DRIVER_SCHEMA.pre("save", async function (next) {
	try {
		if (!this.isModified("password")) {
			return next();
		}
		const SAlt = await BCRYPT.genSalt(10);
		const HASHEDPASSWORD = await BCRYPT.hash(this.password, SAlt);
		this.password = HASHEDPASSWORD;
		next();
	} catch (error) {
		next(error);
	}
});

const DRIVER = MONGOOSE.model("DriverCollection", DRIVER_SCHEMA);

module.exports = DRIVER;
