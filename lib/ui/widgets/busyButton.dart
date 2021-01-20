import 'package:flutter/material.dart';

/// A button that shows a busy indicator in place of title
class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final Function onPressed;
  final bool enabled;
  final Color color;
  final Color textColor;
  final Color cardColor;
  final Color containerColor;
  final Color borderColor;
  const BusyButton(
      {@required this.title,
      this.busy = false,
      @required this.onPressed,
      this.enabled = true,
      this.color,
      this.textColor,
      this.cardColor,
      this.containerColor,
      this.borderColor});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        child: Card(
          elevation: 0,
          child: AnimatedContainer(
            height: widget.busy ? 54 : 50,
            width: widget.busy ? 53 : MediaQuery.of(context).size.width * 1,
            duration: const Duration(milliseconds: 300),
            alignment: Alignment.center,
            // padding: EdgeInsets.symmetric(
            //     horizontal: widget.busy ? 10 : 15,
            //     vertical: widget.busy ? 10 : 10),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: widget.enabled ? Colors.white : Colors.transparent),
              color: widget.enabled ? Color(0xff746bc9) : Colors.transparent,
              // borderRadius: BorderRadius.circular(5),
            ),
            child: !widget.busy
                ? Text(
                    widget.title,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: widget.textColor ?? Colors.black,
                        ),
                    textAlign: TextAlign.center,
                  )
                : CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber)),
          ),
        ),
      ),
    );
  }
}
