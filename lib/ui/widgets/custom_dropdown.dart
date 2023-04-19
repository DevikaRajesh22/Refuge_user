import 'package:flutter/material.dart';
import 'package:refuge_user/ui/widgets/custom_card.dart';

class CustomDropdownButton extends StatefulWidget {
  final String label;
  final IconData leadingIcon;
  final List<Map<String, dynamic>> items;
  final Function(Map<String, dynamic>) onChange;

  const CustomDropdownButton({
    super.key,
    required this.label,
    required this.leadingIcon,
    required this.items,
    required this.onChange,
  });

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  Map<String, dynamic>? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              widget.leadingIcon,
              color: Colors.blue[900],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: DropdownButton<Map<String, dynamic>>(
                hint: Text(widget.label),
                value: _selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    _selectedValue = newValue;
                  });
                  widget.onChange(newValue!);
                },
                items: List.generate(
                  widget.items.length,
                  (index) => DropdownMenuItem<Map<String, dynamic>>(
                    value: widget.items[index],
                    child: Text(widget.items[index]['name']),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
