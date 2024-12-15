void main() {
  // Giả định mảng ma trận
  List<List<int>> array = [
    [22, 22, 33, 68, 39, 45, 67, 39, 123],
    [11, 36, 87, 98, 1923, 1234, 567, 879, 908],
    [512, 543, 435, 546, 90, 890, 89, 687, 56],
    [423, 7869, 76, 5687, 1223, 4576, 456, 4365, 785, 123132],
    [356, 6798, 332, 234, 12124, 7689, 3245, 545678, 546],
    [8734, 4568, 4532, 546875, 34658567, 2543, 567, 5672, 45789],
    [1234, 567, 678, 09, 098, 6987, 8790, 4567, 1243],
    [675, 4576, 5476, 5467, 678, 3456, 3465, 5678, 2143],
    [1243, 3245, 453, 4576, 4567, 8765, 4567, 476, 23345,12313, 1231321]
  ];

  // gán mảng vào trong hàm để xử lý
  print(xulychucnanghaiduongcheo(array));

  List<List<int>> array1 = [[123]];
  print(xulychucnanghaiduongcheo(array1));

  List<List<int>> array2 = [[123, 12313]];
  print(xulychucnanghaiduongcheo(array2));

  List<List<int>> array3 = [[123, 6756, 12321], [123, 689789, 12313]];
  print(xulychucnanghaiduongcheo(array3));
}


dynamic xulychucnanghaiduongcheo(dynamic matran) {
  // Kiểm tra mảng ma trận đó có trống không và số hàng phải bằng với cột , ko đúng thì trả null
  if (matran.isEmpty || matran.length != matran[0].length) {
    return null;
  }

  int totalMatran = matran.length;

  // nếu có 1 số thì là chính nó
  if (totalMatran == 1) {
    return matran[0][0];
  }

  // tính toán ra giao điểm
  int hang = totalMatran ~/ 2;
  int cot = totalMatran ~/ 2;

  return matran[hang][cot];
}
