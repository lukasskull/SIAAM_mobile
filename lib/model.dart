class Obats {
  final int obat_id;
  final String obat_barcode;
  final String obat_golongan;
  final String obat_type;
  final String obat_name;
  final int obat_sediaan_id;
  final int obat_satuan_id;
  final int obat_price;
  final String obat_photo;
  final int obat_min_stock;
  final int obat_current_stock;

  Obats(
      {this.obat_id,
      this.obat_barcode,
      this.obat_golongan,
      this.obat_type,
      this.obat_name,
      this.obat_sediaan_id,
      this.obat_satuan_id,
      this.obat_price,
      this.obat_photo,
      this.obat_min_stock,
      this.obat_current_stock});

  factory Obats.fromJson(Map<String, dynamic> parsedJson) {
    return new Obats(
      //obat_id: parsedJson['obat_id'],
      obat_barcode: parsedJson['obat_barcode'],
      obat_golongan: parsedJson['obat_golongan'],
      obat_type: parsedJson['obat_type'],
      obat_name: parsedJson['obat_name'],
      //obat_sediaan_id: parsedJson['obat_sediaan_id'],
      //obat_satuan_id: parsedJson['obat_satuan_id'],
      //obat_price: parsedJson['obat_price'],
      obat_photo: parsedJson['obat_photo'],
      //obat_min_stock: parsedJson['obat_min_stock'],
      //obat_current_stock: parsedJson['obat_current_stock'],
    );
  }
}
