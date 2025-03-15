import 'package:flutter/material.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';

class AppDropDownButton<T extends DropDownType> extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    this.hint = '',
    this.items = const [],
    this.value,
    this.onChanged,
  });
  final String hint;
  final List<DropDownType> items;
  final DropDownType? value;
  final ValueChanged<DropDownType?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButton<DropDownType>(
        isExpanded: true,
        underline: const SizedBox(),
        hint: Text(hint),
        items:
            items
                .map(
                  (toElement) => DropdownMenuItem(
                    value: toElement,
                    child: Text(toElement.displayValue),
                  ),
                )
                .toList(),
        value: items.contains(value) ? value : null,
        onChanged: onChanged,
      ),
    );
  }
}
