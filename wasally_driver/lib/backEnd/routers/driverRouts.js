const EXPRESS = require("express");
const DRIVER_CONTROLLER = require("../controllers/driverController");

const DRIVER_ROUTER = EXPRESS.Router();

DRIVER_ROUTER.route("/")
	.get(DRIVER_CONTROLLER.getAllDrivers)
	.post(DRIVER_CONTROLLER.addNewDriver);

DRIVER_ROUTER.route("/authentication").get(
	DRIVER_CONTROLLER.authenticateDriver,
);

DRIVER_ROUTER.route("/:driverId")
	.get(DRIVER_CONTROLLER.getDriverByID)
	.patch(DRIVER_CONTROLLER.UpdateDriver)
	.delete(DRIVER_CONTROLLER.deleteDriver);

module.exports = DRIVER_ROUTER;
