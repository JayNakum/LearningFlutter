import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String _message;
  final bool _isME;
  final Key key;
  final String _userImage;
  final String _username;
  MessageBubble(this._message, this._isME, this._userImage, this._username,
      {this.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          _isME ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!_isME)
          CircleAvatar(
            backgroundImage: NetworkImage(_userImage),
          ),
        Container(
          decoration: BoxDecoration(
            color: _isME ? Colors.grey[500] : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  !_isME ? const Radius.circular(0) : const Radius.circular(12),
              bottomRight:
                  _isME ? const Radius.circular(0) : const Radius.circular(12),
            ),
          ),
          width: 140,
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment:
                _isME ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _username,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _message,
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: _isME ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
        if (_isME)
          CircleAvatar(
            backgroundImage: NetworkImage(_userImage),
          ),
      ],
    );
    //     Positioned(
    //       top: -10,
    //       left: 120,
    //       child: CircleAvatar(
    //         backgroundImage: NetworkImage(_userImage),
    //       ),
    //     ),
    //   ],
    //   clipBehavior: Clip.none,
    // );
  }
}
