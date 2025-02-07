import 'dart:isolate';

enum CategoryEnum {
  Jwellery(name: "Jwellery", cid: "id"),
  Food(name: "Jwellery", cid: "food");

  const CategoryEnum({
    required this.name,
    required this.cid,
  });
  final String name;
  final String cid;
}

void dummy() {
  CategoryEnum.Jwellery.name;
}

final class Categoryl {
  void test() {
    ReceivePort receivePort = ReceivePort();
    receivePort.sendPort;

    ///
  }
}

final class seme extends Categoryl {
  var r = Categoryl();
  @override
  void test() {
    // TODO: implement test
    super.test();
  }
}
