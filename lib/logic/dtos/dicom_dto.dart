import 'package:dicom_viewer/logic/dtos/dicom.dart';
import 'package:flutter/foundation.dart';

class DicomDto {
  const DicomDto._({
    required this.pixelData,
    required this.rows,
    required this.columns,
    required this.transferSyntaxUid,
    required this.transferSyntaxUidName,
    required this.patientName,
    required this.imageType,
    required this.patientId,
    required this.fileName,
    required this.instanceCreationDate,
    required this.instanceCreationTime,
    required this.modality,
  });

  final String pixelData;
  final String rows;
  final String columns;
  final String transferSyntaxUid;
  final String transferSyntaxUidName;
  final String patientName;
  final String imageType;
  final String patientId;
  final String fileName;
  final String instanceCreationDate;
  final String instanceCreationTime;
  final String modality;

  DicomDto({
    required this.pixelData,
    required this.rows,
    required this.columns,
    required this.transferSyntaxUid,
    required this.transferSyntaxUidName,
    required this.patientName,
    required this.imageType,
    required this.patientId,
    required this.fileName,
    required this.instanceCreationDate,
    required this.instanceCreationTime,
    required this.modality,
  });

  static DicomDto fromJson(Map<String, dynamic> json) {
    return DicomDto._(
      pixelData: json['pixelData'],
      rows: json['rows'],
      columns: json['columns'],
      transferSyntaxUid: json['transferSyntaxUid'],
      transferSyntaxUidName: json['transferSyntaxUidName'],
      patientName: json['patientName'],
      imageType: json['imageType'],
      patientId: json['patientId'],
      fileName: json['fileName'],
      instanceCreationDate: json['instanceCreationDate'],
      instanceCreationTime: json['instanceCreationTime'],
      modality: json['modality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pixelData': pixelData,
      'rows': rows,
      'columns': columns,
      'transferSyntaxUid': transferSyntaxUid,
      'transferSyntaxUidName': transferSyntaxUidName,
      'patientName': patientName,
      'imageType': imageType,
      'patientId': patientId,
      'fileName': fileName,
      'instanceCreationDate': instanceCreationDate,
      'instanceCreationTime': instanceCreationTime,
      'modality': modality,
    };
  }

  static DicomDto fromDomain(Dicom domain) {
    return DicomDto._(
      pixelData: domain.pixelData,
      rows: domain.rows,
      columns: domain.columns,
      transferSyntaxUid: domain.transferSyntaxUid,
      transferSyntaxUidName: domain.transferSyntaxUidName,
      patientName: domain.patientName,
      imageType: domain.imageType,
      patientId: domain.patientId,
      fileName: domain.fileName,
      instanceCreationDate: domain.instanceCreationDate,
      instanceCreationTime: domain.instanceCreationTime,
      modality: domain.modality,
    );
  }

  Dicom toDomain() {
    return Dicom(
      pixelData: pixelData,
      rows: rows,
      columns: columns,
      transferSyntaxUid: transferSyntaxUid,
      transferSyntaxUidName: transferSyntaxUidName,
      patientName: patientName,
      imageType: imageType,
      patientId: patientId,
      fileName: fileName,
      instanceCreationDate: instanceCreationDate,
      instanceCreationTime: instanceCreationTime,
      modality: modality,
    );
  }

  DicomDto copyWith({
    String? pixelData,
    String? rows,
    String? columns,
    String? transferSyntaxUid,
    String? transferSyntaxUidName,
    String? patientName,
    String? imageType,
    String? patientId,
    String? fileName,
    String? instanceCreationDate,
    String? instanceCreationTime,
    String? modality,
  }) {
    return DicomDto(
      pixelData: pixelData ?? this.pixelData,
      rows: rows ?? this.rows,
      columns: columns ?? this.columns,
      transferSyntaxUid: transferSyntaxUid ?? this.transferSyntaxUid,
      transferSyntaxUidName:
          transferSyntaxUidName ?? this.transferSyntaxUidName,
      patientName: patientName ?? this.patientName,
      imageType: imageType ?? this.imageType,
      patientId: patientId ?? this.patientId,
      fileName: fileName ?? this.fileName,
      instanceCreationDate: instanceCreationDate ?? this.instanceCreationDate,
      instanceCreationTime: instanceCreationTime ?? this.instanceCreationTime,
      modality: modality ?? this.modality,
    );
  }

  @override
  String toString() {
    return 'DicomDto(pixelData: $pixelData, rows: $rows, columns: $columns, transferSyntaxUid: $transferSyntaxUid, transferSyntaxUidName: $transferSyntaxUidName, patientName: $patientName, imageType: $imageType, patientId: $patientId, fileName: $fileName,instanceCreationDate: $instanceCreationDate, instanceCreationTime: $instanceCreationTime, modality: $modality)';
  }
}
