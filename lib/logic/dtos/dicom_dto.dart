import 'package:dicom_viewer/logic/dtos/dicom.dart';
import 'package:flutter/foundation.dart';

class DicomDto {
  const DicomDto._({required this.pixelData});

  final String pixelData;

  DicomDto({required this.pixelData});

  static DicomDto fromJson(Map<String, dynamic> json) {
    return DicomDto._(
      pixelData: json['pixelData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pixelData': pixelData,
    };
  }

  static DicomDto fromDomain(Dicom domain) {
    return DicomDto._(pixelData: domain.pixelData);
  }

  Dicom toDomain() {
    return Dicom(pixelData: pixelData);
  }

  DicomDto copyWith({
    String? pixelData,
  }) {
    return DicomDto(pixelData: pixelData ?? this.pixelData);
  }

  @override
  String toString() {
    return 'DicomDto(pixelData: $pixelData)';
  }
}
