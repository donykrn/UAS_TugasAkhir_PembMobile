class Cases {
  final String id;
  final String nama;
  final String gender;
  final int umur;
  final String alamat;
  final String kota;
  final String negara;
  final String status;
  final String updated;

  Cases(
      {this.id,
      this.nama,
      this.gender,
      this.umur,
      this.alamat,
      this.kota,
      this.negara,
      this.status,
      this.updated});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      id: json['_id'] as String,
      nama: json['nama'] as String,
      gender: json['gender'] as String,
      umur: json['umur'] as int,
      alamat: json['alamat'] as String,
      kota: json['kota'] as String,
      negara: json['negara'] as String,
      status: json['status'] as String,
      updated: json['updated'] as String,
    );
  }

  @override
  String toString() {
    return 'Cases{id: $id, nama: $nama, umur: $umur}';
  }
}
