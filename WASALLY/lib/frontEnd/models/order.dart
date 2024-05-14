class Order {
  late String? id;
  late DateTime? creationDate;
  late String? orderStatus;
  late String dlelivaryMethod;
  late String? orderPrice;
  late String sourceCity;
  late String sourceStreet;
  late String sourceHouse;
  late String sourceFlat;
  late String sourceContactName;
  late String sourceContactPhone;
  late String sourceContactAddress;
  late String destinationCity;
  late String destinationStreet;
  late String destinationHouse;
  late String destinationFlat;
  late String destinationContactName;
  late String destinationContactPhone;
  late String destinationContactAddress;
  late String? userID;
  late String? driverID;

  Order({
    this.id,
    this.creationDate,
    this.orderStatus,
    required this.dlelivaryMethod,
    this.orderPrice,
    required this.sourceCity,
    required this.sourceStreet,
    required this.sourceHouse,
    required this.sourceFlat,
    required this.sourceContactName,
    required this.sourceContactPhone,
    required this.sourceContactAddress,
    required this.destinationCity,
    required this.destinationStreet,
    required this.destinationHouse,
    required this.destinationFlat,
    required this.destinationContactName,
    required this.destinationContactPhone,
    required this.destinationContactAddress,
    this.userID,
    this.driverID,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['_id'],
        creationDate: json['creationDate'],
        orderStatus: json['orderStatus'],
        dlelivaryMethod: json['dlelivaryMethod'],
        orderPrice: json['orderPrice'],
        sourceCity: json['sourceCity'],
        sourceStreet: json['sourceStreet'],
        sourceHouse: json['sourceHouse'],
        sourceFlat: json['sourceFlat'],
        sourceContactName: json['sourceContactName'],
        sourceContactPhone: json['sourceContactPhone'],
        sourceContactAddress: json['sourceContactAddress'],
        destinationCity: json['destinationCity'],
        destinationStreet: json['destinationStreet'],
        destinationHouse: json['destinationHouse'],
        destinationFlat: json['destinationFlat'],
        destinationContactName: json['destinationContactName'],
        destinationContactPhone: json['destinationContactPhone'],
        destinationContactAddress: json['destinationContactAddress'],
        userID: json['userID'],
        driverID: json['driverID'],
      );

  Map<String, dynamic> toJson() => {
        'dlelivaryMethod': dlelivaryMethod,
        'orderPrice': orderPrice,
        'sourceCity': sourceCity,
        'sourceStreet': sourceStreet,
        'sourceHouse': sourceHouse,
        'sourceFlat': sourceFlat,
        'sourceContactName': sourceContactName,
        'sourceContactPhone': sourceContactPhone,
        'sourceContactAddress': sourceContactAddress,
        'destinationCity': destinationCity,
        'destinationStreet': destinationStreet,
        'destinationHouse': destinationHouse,
        'destinationFlat': destinationFlat,
        'destinationContactName': destinationContactName,
        'destinationContactPhone': destinationContactPhone,
        'destinationContactAddress': destinationContactAddress,
        'userID': userID,
        'driverID': driverID,
      };
}
