abstract class IDataStrategy {
  static IDataStrategy getInstance() {
    throw UnimplementedError();
  }

  List loadSpells();
}
