class Common {
  static String getChatId(String userId, String peerId) {
    if (userId.hashCode <= peerId.hashCode) return '$userId-$peerId';
    return '$peerId-$userId';
  }
}
