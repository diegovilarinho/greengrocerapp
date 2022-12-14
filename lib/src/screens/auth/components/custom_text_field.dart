import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final double distance;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.distance = 15,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.distance),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: isObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off))
                : null,
            labelText: widget.label,
            isDense: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
