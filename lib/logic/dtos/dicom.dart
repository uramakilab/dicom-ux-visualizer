class Dicom {
  final String pixelData;
  final String transferSyntaxUid;
  final String transferSyntaxUidName;
  final String patientName;
  factory Dicom.create({
    required String pixelData,
    required String transferSyntaxUid,
    required String transferSyntaxUidName,
    required String patientName,
  }) =>
      Dicom(
        pixelData: pixelData,
        transferSyntaxUid: transferSyntaxUid,
        transferSyntaxUidName: transferSyntaxUidName,
        patientName: patientName,
        );

  Dicom({
    required this.pixelData,
    required this.transferSyntaxUid,
    required this.transferSyntaxUidName,
    required this.patientName,
  });
  Dicom copyWith({
    String? pixelData,
    String? transferSyntaxUid,
    String? transferSyntaxUidName,
    String? patientName,
  }) {
    return Dicom(
      pixelData: pixelData ?? this.pixelData,
      transferSyntaxUid: transferSyntaxUid ?? this.transferSyntaxUid,
      transferSyntaxUidName: transferSyntaxUidName ?? this.transferSyntaxUidName,
      patientName: patientName ?? this.patientName,
      );
  }

  @override
  String toString() {
    return 'Dicom(pixelData: $pixelData, transferSyntaxUid: $transferSyntaxUid, transferSyntaxUidName: $transferSyntaxUidName, patientName: $patientName)';
  }
}
