import 'package:VendorApp/Models/Message.dart';
import 'package:VendorApp/Models/Order.dart';
import 'package:VendorApp/Models/User.dart';
import 'package:VendorApp/Services/database.dart';
import 'package:VendorApp/components/chatconsts.dart';
import 'package:VendorApp/main_pages/OrdersScreen/chattile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  final Order order;

  const ChatScreen({Key key, this.order}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String messageText;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<List<Message>>(
      create: (_) => DataService(uid: user.uid).messagesFromOrder(widget.order),
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          title: Text('Chat'),
          backgroundColor: Color.fromRGBO(0, 136, 204, 100),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        //clears current message after sent
                        messageTextController.clear();
                        messageText != null
                            ? DataService().sendMessage(
                                widget.order,
                                Message(
                                    time: DateTime.now(),
                                    text: messageText,
                                    studentID: widget.order.studentUID,
                                    vendorID: widget.order.vendorUID,
                                    sendorID: user.uid))
                            : messageTextController.clear();
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessagesStream extends StatefulWidget {
  @override
  _MessagesStreamState createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    List<Message> message = Provider.of<List<Message>>(context);
    List<Message> messages = message == null ? [] : message.reversed.toList();
    List<MessageBubble> messageBubbles = messages
        .map((e) => MessageBubble(
              isMe: e.sendorID == user.uid,
              message: e.text,
            ))
        .toList();
    return Expanded(
      child: ListView(
        reverse: true,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        children: messageBubbles,
      ),
    );
  }
}
