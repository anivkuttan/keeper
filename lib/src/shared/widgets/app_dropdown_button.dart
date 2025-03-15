import 'package:flutter/material.dart';
import 'package:keeper/src/shared/model/dropdown_type.dart';

class AppDropDownButton<T extends DropDownType> extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
  });

  final String hint;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      builder: (FormFieldState<T> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: state.hasError ? Colors.red : Colors.grey.shade300,
                ),
              ),
              child: DropdownButton<T>(
                isExpanded: true,
                underline: const SizedBox(),
                hint: Text(hint),
                value: items.contains(value) ? value : null,
                items:
                    items.map((toElement) {
                      return DropdownMenuItem(
                        value: toElement,
                        child: Text(toElement.displayValue),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  state.didChange(newValue);
                  if (onChanged != null) {
                    onChanged!(newValue);
                  }
                },
              ),
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 16),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
