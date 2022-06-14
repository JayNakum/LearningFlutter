class Address {
  // final String id;
  final String addressLine1;
  final String addressLine2;
  final String landmark;
  final String city;
  final String state;
  final String country;

  Address({
    // required this.id,
    required this.addressLine1,
    this.addressLine2 = '',
    required this.landmark,
    required this.city,
    required this.state,
    required this.country,
  });
}
