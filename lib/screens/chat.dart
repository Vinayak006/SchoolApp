
import 'package:flutter/material.dart';
import '../custom_painter.dart';

class Chat extends StatefulWidget {
  final String name;
  final String image;
  const Chat({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController messageController = TextEditingController();

  List<Message> chatMessages = [];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 250, 255),
        appBar: AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 18, 83, 135),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 23, 117, 193),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 20.0,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.13,
                  height: MediaQuery.of(context).size.width * 0.13,
                  image: AssetImage("assets/images/${widget.image}.jpg"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(.9),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(
                Icons.videocam_outlined,
                size: 28,
                color: Colors.white.withOpacity(.8),
              ),
            ),
            IconButton(
              splashRadius: 20,
              onPressed: () {},
              icon: Icon(
                Icons.call_outlined,
                size: 28,
                color: Colors.white.withOpacity(.8),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            CustomPaint(
              painter: ChatPaint(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
            ),
            Expanded(
              child: ListView.separated(
                reverse: true,
                itemCount: chatMessages.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 0,
                  );
                },
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Align(
                      alignment: chatMessages[index].isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: chatMessages[index].isUser
                            ? const Color.fromARGB(255, 18, 83, 135)
                                .withOpacity(.3)
                            : Colors.white,
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 6, left: 10, right: 10),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth:
                                    MediaQuery.of(context).size.width * 0.1),
                            child: Stack(
                              children: [
                                Text(
                                  "${chatMessages[index].text}\n",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 18, 83, 135),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Text(
                                    "${chatMessages[index].time.hour}.${chatMessages[index].time.minute}",
                                    style: TextStyle(
                                      fontSize: 8,
                                      color:
                                          const Color.fromARGB(255, 18, 83, 135)
                                              .withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 5,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 18, 83, 135),
                    child: IconButton(
                      onPressed: () {
                        String message = messageController.text;
                        if (message != "") {
                          setState(() {
                            chatMessages.insert(
                              0,
                              Message(
                                text: message,
                                time: DateTime.now(),
                                isUser: false,
                              ),
                            );
                          });
                          messageController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.question_mark_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      cursorColor: Colors.grey.shade400,
                      controller: messageController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        hintText: "Type your message here",
                        hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 18, 83, 135),
                    child: IconButton(
                      onPressed: () {
                        String message = messageController.text;
                        if (message != "") {
                          setState(() {
                            chatMessages.insert(
                              0,
                              Message(
                                text: message,
                                time: DateTime.now(),
                                isUser: true,
                              ),
                            );
                          });
                          messageController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  late final String text;
  late final DateTime time;
  late final bool isUser;
  Message({required this.text, required this.time, required this.isUser});
}