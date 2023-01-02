import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'jsonValue')
enum PickupOption {
  delivery('delivery'),
  pickUp('pickUp'),
  diningRoom('diningRoom');

  const PickupOption(this.jsonValue);
  final String jsonValue;
}

@JsonEnum(valueField: 'jsonValue')
enum DeliveryStatus {
  pending('pending'),
  upcoming('upcoming'),
  onTheWay('onTheWay'),
  delivered('delivered'),
  canceled('canceled');

  const DeliveryStatus(this.jsonValue);
  final String jsonValue;
}
