class NetworkChangeList {
  final String id;
  final int changeListVersion;
  final bool isDelete;

  NetworkChangeList({required this.id, required this.changeListVersion, required this.isDelete});
}