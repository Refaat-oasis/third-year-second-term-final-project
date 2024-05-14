const MONGOOSE = require("mongoose");
const BCRYPT = require("bcrypt");
//const validator = require('validator');

const USER_SCHEMA = new MONGOOSE.Schema({
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
});

USER_SCHEMA.pre("save", async function (next) {
	try {
		if (!this.isModified("password")) {
			return next();
		}
		const SALT = await BCRYPT.genSalt(10);
		const HASHEDPASSWORD = await BCRYPT.hash(this.password, SALT);
		this.password = HASHEDPASSWORD;
		next();
	} catch (error) {
		next(error);
	}
});

const USER = MONGOOSE.model("UserCollection", USER_SCHEMA);
module.exports = USER;
