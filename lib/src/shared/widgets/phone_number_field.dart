import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    this.phoneController,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.autofocus = false,
    this.countryButtonStyle,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.initialValue,
  });
  final PhoneController? phoneController;
  final String? hintText;
  final String? labelText;
  final PhoneNumber? initialValue;
  final bool autofocus;
  final CountryButtonStyle? countryButtonStyle;
  final void Function(PhoneNumber?)? onSaved;
  final void Function(PhoneNumber)? onChanged;
  final String? Function(PhoneNumber?)? validator;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PhoneFormField(
          autofocus: autofocus,
          controller: phoneController,
          onSaved: onSaved,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: hintText,
            suffixIcon: suffixIcon,
          ),
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          countrySelectorNavigator: const CountrySelectorNavigator.dialog(),
          onChanged: onChanged,
          enabled: true,
          isCountrySelectionEnabled: true,
          countryButtonStyle:
              countryButtonStyle ??
              const CountryButtonStyle(
                showDialCode: true,
                showDropdownIcon: false,
                showIsoCode: false,
                showFlag: true,
                flagSize: 16,
              ),
        ),
      ],
    );
  }
}
