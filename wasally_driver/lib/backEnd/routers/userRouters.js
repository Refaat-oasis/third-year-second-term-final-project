const EXPRESS = require("express");
const USER_CONTROLLER = require("../controllers/userController");

const USER_ROUTERS = EXPRESS.Router();

USER_ROUTERS.route("/")
	.get(USER_CONTROLLER.getAllUsers)
	.post(USER_CONTROLLER.addNewUser);

USER_ROUTERS.route("/authentication").get(USER_CONTROLLER.authenticateUser);

USER_ROUTERS.route("/:userID")
	.get(USER_CONTROLLER.getUserByID)
	.patch(USER_CONTROLLER.updateUser)
	.delete(USER_CONTROLLER.deleteUser);

module.exports = USER_ROUTERS;
