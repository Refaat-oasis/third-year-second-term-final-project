const EXPRESS = require("express");
const OERDER_CONTROLLER = require("../controllers/orderController");

const ORDER_ROUTER = EXPRESS.Router();

ORDER_ROUTER.route("/")
	.get(OERDER_CONTROLLER.getAllOrders)
	.post(OERDER_CONTROLLER.addNewOrder);

ORDER_ROUTER.route("/:orderId")
	.get(OERDER_CONTROLLER.getOrderById)
	.patch(OERDER_CONTROLLER.updateOrder)
	.delete(OERDER_CONTROLLER.deleteOrder);

// ORDER_ROUTER.route("/:Type")

ORDER_ROUTER.route("/:driverID").get(OERDER_CONTROLLER.getAllOrdersForDriver);

module.exports = ORDER_ROUTER;
