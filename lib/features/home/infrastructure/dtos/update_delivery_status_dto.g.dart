// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_delivery_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$_UpdateDeliveryStatusDtoToJson(
    _$_UpdateDeliveryStatusDto instance) {
  final val = <String, dynamic>{
    'deliveryStatus': _$DeliveryStatusEnumMap[instance.deliveryStatus]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deliveryId', instance.deliveryId);
  writeNotNull('employeeCancelNote', instance.employeeCancelNote);
  return val;
}

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.pending: 'pending',
  DeliveryStatus.upcoming: 'upcoming',
  DeliveryStatus.onTheWay: 'onTheWay',
  DeliveryStatus.delivered: 'delivered',
  DeliveryStatus.canceled: 'canceled',
};
