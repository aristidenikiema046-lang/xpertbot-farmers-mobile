class Farmer {
  final int id;
  final String identifier;
  final String firstname;
  final String lastname;
  final String phone;
  final double creditLimit;

  Farmer({
    required this.id,
    required this.identifier,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.creditLimit,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) {
    return Farmer(
      id: json['id'],
      identifier: json['identifier'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      phone: json['phone'],
      // Conversion de la limite de crédit en double
      creditLimit: double.parse(json['credit_limit'].toString()),
    );
  }
}