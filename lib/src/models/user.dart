class User {
  final String id;
  final String name;
  List<String> conversations;
  User({this.conversations = const [], required this.id, required this.name});
  String get initials => '${name[0]}${name[1]}';
  static final List<User> users = [
    User(
      id: '1',
      name: 'Praveen Pilli',
    ),
    User(
      id: '9',
      name: 'Shweta Singh',
    ),
    User(
      id: '8',
      name: 'Sangit banik',
    ),
    User(
      id: '7',
      name: 'Priyanka Paul',
    ),
    User(
      id: '6',
      name: 'Sagar Paul',
    ),
    User(
      id: '5',
      name: 'Gopi krishna',
    ),
    User(
      id: '4',
      name: 'Sashi Guduri',
    ),
    User(
      id: '3',
      name: 'Random Stranger',
    ),
    User(
      id: '2',
      name: 'Boss',
    ),
  ];
}
