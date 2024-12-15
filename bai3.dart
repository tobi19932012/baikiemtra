enum KieuDoAn { diet, fat, vegan }

class DoAn {
  int id;
  String tenDoAn;
  KieuDoAn loaiDoAn;
  int giaTien;

  DoAn(this.id, this.tenDoAn, this.loaiDoAn, this.giaTien);

  static where(bool Function(dynamic food) param0) {}
}

enum LoaiCungCap { Asian, Europe, Africa }

class NhaCungCap {
  final int id;
  final String tenNhaCungCap;
  final LoaiCungCap NguonGoc;
  final List<DoAn> danhSachDoAn;

  NhaCungCap(this.id, this.tenNhaCungCap, this.NguonGoc, this.danhSachDoAn);

  static dynamic thucAnTheoNhaCungCap(dynamic nhacungcap) {
    dynamic ketqua = {
      LoaiCungCap.Asian: [],
      LoaiCungCap.Europe: [],
      LoaiCungCap.Africa: [],
    };

    for (var cungcap in nhacungcap) {
      ketqua[cungcap.NguonGoc]?.addAll(cungcap.danhSachDoAn);
    }

    return ketqua;
  }

  dynamic tinhtienAn() {
    return danhSachDoAn
        .where((doan) => doan.loaiDoAn == KieuDoAn.vegan)
        .fold(0, (sum, doan) => sum + doan.giaTien);
  }
}

void main() {
  // Tạo danh sách đồ ăn
  final thucan1 = DoAn(1, "Salad", KieuDoAn.vegan, 4);
  final thucan2 = DoAn(2, "Burger", KieuDoAn.fat, 7);
  final thucan3 = DoAn(3, "Rice", KieuDoAn.diet, 6);
  final thucan4 = DoAn(4, "Fruit Bowl", KieuDoAn.vegan, 9);

  // Tạo danh sách nhà cung cấp
  final nhacungcap1 =
      NhaCungCap(1, "Asian Supplier", LoaiCungCap.Asian, [thucan1, thucan2]);

  final nhacungcap2 = NhaCungCap(
      2, "European Supplier", LoaiCungCap.Europe, [thucan3, thucan4]);

  final nhacungcap3 = NhaCungCap(
      3, "African Supplier", LoaiCungCap.Africa, [thucan2, thucan4, thucan3]);

  final nhacungcap = [nhacungcap1, nhacungcap2, nhacungcap3];

  print(nhacungcap3.NguonGoc);


  final KieuCungCap = NhaCungCap.thucAnTheoNhaCungCap(nhacungcap);
  for (var kieucungcap in KieuCungCap.keys) {
    for (var thucan in KieuCungCap[kieucungcap]!) {
      print("  - Tên đồ ăn ${thucan.tenDoAn} - Giá tiền: ${thucan.giaTien}");
    }
  }

  for (var cungcap in nhacungcap) {
    dynamic tien = cungcap.tinhtienAn();
    print(
        "- Đồ ăn chay của từng nhà cung cấp ${cungcap.tenNhaCungCap} - Giá tiền cung cấp ${tien}");
  }
}
