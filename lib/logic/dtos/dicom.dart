class Dicom {
  final String pixelData;

  factory Dicom.create({
    required String pixelData,
  }) =>
      Dicom(pixelData: pixelData);

  Dicom({
    required this.pixelData,
  });
  Dicom copyWith({
    String? pixelData,
  }) {
    return Dicom(pixelData: pixelData ?? this.pixelData);
  }

  @override
  String toString() {
    return 'Dicom(pixelData: $pixelData)';
  }
}
