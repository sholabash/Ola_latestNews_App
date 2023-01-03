import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../item_model.dart';

final _root = 'https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client = Client();

  fectTopIds() async {
    final response = await client.get(
      Uri.parse('$_root/topstories.json'),
    );
    final ids = json.decode(response.body);
    return ids;
  }

  fechItem(int id) async {
    final response = await client.get(
      Uri.parse('$_root/item/$id.json'),
    );
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
