void main() {
  // Khởi tạo biến M
  List<List<int>> M = [
    [2, 2, 4],
    [3, 5, 20],
    [6, 7, 10]
  ];

  // Khởi tạo biến N
  List<List<int>> N = [
    [11, 15, 80],
    [10, 22, 36],
    [60, 50, 30]
  ];

  // Trả về kết quả, gọi hàm kiemtrahaimatran, pirnt từng hàng
  List<List<int>> ketqua = kiemtrahaimatran(M, N);
  print("Tính tổng hai ma trận M và N:");
  for (var traketquatunghang in ketqua) {
    print("từng hàng ${traketquatunghang}");
  }
}

// Hàm xử lý chức năng hai ma trận rồi tính tổng lại
List<List<int>> kiemtrahaimatran(List<List<int>> M, List<List<int>> N) {
  // Ma trận N và N không được để trống
  if (M.isEmpty || N.isEmpty) {
    print("Không được để rỗng 1 trong hai ma trận");
  }

  // tổng hàng M
  int hangM = M.length;
  // tổng cột M
  int cotM = M[0].length;
  // tổng cột N
  int hangN = N.length;
  // tổng hàng N
  int cotN = N[0].length;

  // Kiểm tra Hàng/Cột M bằng với Hàng/cột N
  if (hangM != hangN || cotM != cotN) {
    print("Hàng và cột của hai ma trận phải khác nhau");
  }

  // Tạo ma trận kết quả với kích thước giống ma trận đầu vào
  List<List<int>> ketqua = List.generate(
    hangM,
    (i) => List.filled(cotM, 0),
    growable: false, ///growable cố dịnh các phần tử trong mảng
  );

  // Tính tổng M và N
  for (int i = 0; i < hangM; i++) {
    for (int j = 0; j < cotM; j++) {
      ketqua[i][j] = M[i][j] + N[i][j];
    }
  }

  return ketqua;
}
