import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/value_objects.dart';

part 'profile_details_dto.freezed.dart';

part 'profile_details_dto.g.dart';

@Freezed(toJson: true)
class ProfileDetailsDto with _$ProfileDetailsDto {
  const factory ProfileDetailsDto({
    required String name,
    required String phone,
  }) = _ProfileDetailsDto;

  factory ProfileDetailsDto.fromDomain(ProfileDetails details) {
    return ProfileDetailsDto(
      name: details.name,
      phone: details.phone,
    );
  }
}
