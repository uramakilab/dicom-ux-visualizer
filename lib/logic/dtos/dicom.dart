class Dicom {
  final String pixelData;
  final String transferSyntaxUid;
  final String transferSyntaxUidName;
  final String patientName;
  final String imageType;
  final String patientId;
  final String fileName;
  final String instanceCreationDate;
  final String instanceCreationTime;
  final String modality;
  factory Dicom.create({
    required String pixelData,
    required String transferSyntaxUid,
    required String transferSyntaxUidName,
    required String patientName,
    required String imageType,
    required String patientId,
    required String fileName,
    required String instanceCreationDate,
    required String instanceCreationTime,
    required String modality,
  }) =>
      Dicom(
        pixelData: pixelData,
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

  Dicom({
    required this.pixelData,
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
  Dicom copyWith({
    String? pixelData,
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
    return Dicom(
      pixelData: pixelData ?? this.pixelData,
      transferSyntaxUid: transferSyntaxUid ?? this.transferSyntaxUid,
      transferSyntaxUidName: transferSyntaxUidName ?? this.transferSyntaxUidName,
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
    return 'Dicom(pixelData: $pixelData, transferSyntaxUid: $transferSyntaxUid, transferSyntaxUidName: $transferSyntaxUidName, patientName: $patientName, imageType: $imageType, patientId: $patientId, fileName: $fileName, instanceCreationDate: $instanceCreationDate, instanceCreationTime: $instanceCreationTime, modality: $modality)';
  }
}
