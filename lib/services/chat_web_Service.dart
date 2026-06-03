import 'dart:async';
import 'dart:convert';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocket? _socket;
  factory ChatWebService() => _instance;
  ChatWebService._internal();

  final _searchResultController = StreamController<Map<String, dynamic>>.broadcast();
  final _contentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream => _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

void connect() {
  if (_socket != null) return;  // ← already connected, skip
  
  _socket = WebSocket(Uri.parse("ws://localhost:8000/ws/chat"));
  _socket!.messages.listen((message) {
    final data = json.decode(message);
    if (data['type'] == 'search_result') {
      _searchResultController.add({
        'type': 'search_result',
        'data': List<Map<String, dynamic>>.from(data['data'])
      });
    } else if (data['type'] == 'content') {
      _contentController.add({
        'type': 'content',
        'data': data['data']
      });
    }
  },
  onError: (error) => print("WebSocket error: $error"),
  onDone: () {
    print("WebSocket closed");
    _socket = null;  // ← reset so it can reconnect if needed
  },
  );
}

  void chat(String query) {
    _socket!.send(json.encode({'query': query}));
  }
}