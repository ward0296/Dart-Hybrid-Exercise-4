//References for this exercise: dart.dev, course website, Youtube, StackOverflow,and google.
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  const url = 'https://random-data-api.com/api/v2/users?size=10';

  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> userList = jsonDecode(response.body);

      // this loops through the user data, also prints the  uid, first_name, and last_name.
      for (var user in userList) {
        print('${user['id']}: ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed loading users. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('An error has occurred: $e');
  }
}
