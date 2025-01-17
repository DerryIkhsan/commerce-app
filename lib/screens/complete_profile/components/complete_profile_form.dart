import 'package:commerce_app/components/custom_suffix_icon.dart';
import 'package:commerce_app/components/default_button.dart';
import 'package:commerce_app/components/form_error.dart';
import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_config.dart';
import '../../../screens/otp/otp_screen.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName, lastName, phoneNumber, address;

  void addError({String error}){
    if(!errors.contains(error)){
      setState((){
        errors.add(error);
      });
    }
  }

  void removeError({String error}){
    if(errors.contains(error)){
      setState((){
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: (){
              if(_formKey.currentState.validate()){
                // Go to OTP screen
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            }
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
          onSaved: (newValue) => address = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kAddressNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kAddressNullError);

              return "";
            }

            return null;
          },
          decoration: InputDecoration(
              labelText: "Address",
              labelStyle: TextStyle(color: kTextColor),
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Location point.svg",
              )),
        );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
          keyboardType: TextInputType.number,
          onSaved: (newValue) => phoneNumber = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPhoneNumberNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kPhoneNumberNullError);

              return "";
            }

            return null;
          },
          decoration: InputDecoration(
              labelText: "Phone Number",
              labelStyle: TextStyle(color: kTextColor),
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/Phone.svg",
              )),
        );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
          onSaved: (newValue) => lastName = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNameNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kNameNullError);

              return "";
            }

            return null;
          },
          decoration: InputDecoration(
              labelText: "Last Name",
              labelStyle: TextStyle(color: kTextColor),
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/User.svg",
              )),
        );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
          onSaved: (newValue) => firstName = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kNameNullError);
            } 
            return null;
          },
          validator: (value) {
            if (value.isEmpty) {
              addError(error: kNameNullError);

              return "";
            }

            return null;
          },
          decoration: InputDecoration(
              labelText: "First Name",
              labelStyle: TextStyle(color: kTextColor),
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSuffixIcon(
                svgIcon: "assets/icons/User.svg",
              )),
        );
  }
}