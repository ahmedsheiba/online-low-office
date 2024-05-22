class Message {
  final String messages;
  final String id;

  Message(this.messages, this.id);

  factory Message.fromJson(jasonData) {
    return Message(jasonData['message'], jasonData['id']);
  }
}
