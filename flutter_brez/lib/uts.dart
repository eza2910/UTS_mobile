import 'dart:io';

abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);
  double get tarifDasar => _tarifDasar;
  double hitungTarif(int jml);
}


class Taksi extends Transportasi {
  double jarak;
  Taksi(super.id, super.nama, super._tarifDasar, super.kapasitas, this.jarak);
  @override double hitungTarif(int jml) => tarifDasar * jarak;
}

class Bus extends Transportasi {
  bool wifi;
  Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.wifi);
  @override double hitungTarif(int jml) => (tarifDasar * jml) + (wifi ? 5000 : 0);
}

class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);
  @override double hitungTarif(int jml) => tarifDasar * jml * (kelas == "Bisnis" ? 1.5 : 1);
}


class Pemesanan {
  String id, nama;
  Transportasi t;
  int jml;
  double total;
  Pemesanan(this.id, this.nama, this.t, this.jml, this.total);
  void cetak() => print("\n$id | $nama | ${t.nama} | $jml org | Rp${total.toStringAsFixed(2)}");
}


Pemesanan buatPemesanan(Transportasi t, String n, int j, String id) =>
    Pemesanan(id, n, t, j, t.hitungTarif(j));

void tampilSemua(List<Pemesanan> d) {
  print("\n=== DAFTAR PEMESANAN ===");
  for (var p in d) p.cetak();
}


void main() {
  List<Pemesanan> daftar = [];

  print("=== SMART RIDE ===");
  stdout.write("Masukkan nama pelanggan: ");
  String nama = stdin.readLineSync()!;

  print("Pilih transportasi:");
  print("1. Taksi\n2. Bus\n3. Pesawat");
  stdout.write("Pilihan: ");
  int pilih = int.parse(stdin.readLineSync()!);

  stdout.write("Jumlah penumpang: ");
  int jml = int.parse(stdin.readLineSync()!);

  Transportasi? t;

  if (pilih == 1) {
    stdout.write("Masukkan jarak (km): ");
    double jarak = double.parse(stdin.readLineSync()!);
    t = Taksi("T1", "BlueBird", 7500, 4, jarak);
  } else if (pilih == 2) {
    stdout.write("Ada WiFi? (y/n): ");
    bool wifi = stdin.readLineSync()!.toLowerCase() == 'y';
    t = Bus("B1", "TransJakarta", 3000, 30, wifi);
  } else if (pilih == 3) {
    stdout.write("Kelas (Ekonomi/Bisnis): ");
    String kelas = stdin.readLineSync()!;
    t = Pesawat("P1", "Garuda", 1500000, 180, kelas);
  }

  if (t != null) {
    var p = buatPemesanan(t, nama, jml, "PM${daftar.length + 1}");
    daftar.add(p);
    tampilSemua(daftar);
  } else {
    print("Pilihan tidak valid!");
  }
}