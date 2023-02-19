import 'package:dicom_viewer/logic/dtos/dicom.dart';
import 'package:flutter/foundation.dart';

class DicomDto {
  const DicomDto._(
      {required this.pixelData, required this.transferSyntaxUid, required this.transferSyntaxUidName, required this.patientName});

  final String pixelData;
  final String transferSyntaxUid;
  final String transferSyntaxUidName;
  final String patientName;

  DicomDto({required this.pixelData, required this.transferSyntaxUid, required this.transferSyntaxUidName, required this.patientName});

  static DicomDto fromJson(Map<String, dynamic> json) {
    return DicomDto._(
      pixelData: json['pixelData'],
      transferSyntaxUid: json['transferSyntaxUid'],
      transferSyntaxUidName: json['transferSyntaxUidName'],
      patientName: json['patientName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pixelData': pixelData,
      'transferSyntaxUid': transferSyntaxUid,
      'transferSyntaxUidName': transferSyntaxUidName,
      'patientName': patientName,
    };
  }

  static DicomDto fromDomain(Dicom domain) {
    return DicomDto._(
      pixelData: domain.pixelData,
      transferSyntaxUid: domain.transferSyntaxUid,
      transferSyntaxUidName: domain.transferSyntaxUidName,
      patientName: domain.patientName,
      );
  }

  Dicom toDomain() {
    return Dicom(
      pixelData: pixelData,
      transferSyntaxUid: transferSyntaxUid,
      transferSyntaxUidName: transferSyntaxUidName,
      patientName: patientName,
      );
  }

  DicomDto copyWith({
    String? pixelData,    
    String? transferSyntaxUid,
    String? transferSyntaxUidName,
    String? patientName,
  }) {
    return DicomDto(
      pixelData: pixelData ?? this.pixelData,
      transferSyntaxUid: transferSyntaxUid ?? this.transferSyntaxUid,
      transferSyntaxUidName: transferSyntaxUidName ?? this.transferSyntaxUidName,
      patientName: patientName ?? this.patientName,
      );
  }

  @override
  String toString() {
    return 'DicomDto(pixelData: $pixelData, transferSyntaxUid: $transferSyntaxUid, transferSyntaxUidName: $transferSyntaxUidName, patientName: $patientName)';
  }
}
