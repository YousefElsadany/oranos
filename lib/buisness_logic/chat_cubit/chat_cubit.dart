import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:oranos/data/model/chat_model.dart';
import 'package:http/http.dart' as http;

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);

  final List<ChatModel> msgList = <ChatModel>[];

  void getChat(String userReply) async {
    var response = await http.get(Uri.parse(
        "http://api.brainshop.ai/get?bid=167355&key=CbtBJcCmY96vzXjL&uid=[Aishwarya pulluri]&msg=[$userReply]"));
    var data = jsonDecode(response.body);
    var botReply = data["cnt"];
    ChatModel msg = ChatModel(
      text: botReply,
      name: "Bot",
      type: false,
    );
    msgList.insert(0, msg);
    emit(ChatLoaded());
  }

  void send(text) async {
    ChatModel msg = ChatModel(
      text: text,
      name: "YOU",
      type: true,
    );

    msgList.insert(0, msg);
    emit(ChatSend());
    getChat(text);
  }
}
