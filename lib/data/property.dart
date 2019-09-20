List<Property> properties = [
  new Property('WEIGHT', '300', 'G'),
  new Property('VITAMINS', 'A, B6', 'VIT'),
  new Property('CALORIES', '267', 'CAL'),
  new Property('UTALE', '26', 'VND'),
  new Property('AMAGE', '128', 'VND'),
];

class Property {
  String name;
  String value;
  String unit;
  Property(this.name, this.value, this.unit);
}
