import 'package:azodha_task/core/app/app_colors.dart';
import 'package:azodha_task/features/contact/presentation/bloc/contact_bloc.dart';
import 'package:azodha_task/features/contact/presentation/widgets/my_button.dart';
import 'package:azodha_task/features/contact/presentation/widgets/my_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      //add event to submit
      context.read<ContactBloc>().add(AddContactEvent(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            phoneNumber: _phoneController.text.trim(),
            address: _addressController.text.trim(),
          ));
    }
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text(
          'Contact Form',
          style: GoogleFonts.poppins(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        )),
        body: BlocConsumer<ContactBloc, ContactState>(
          listener: (context, state) {
            if (state is ContactAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Contact added successfully')),
              );
              _resetForm();
            } else if (state is ContactError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.error}')),
              );
            }
          },
          builder: (context, state) {
            if (state is ContactLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ContactAdded || state is ContactInitial) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyFromField(
                        controller: _nameController,
                        lable: 'Name',
                        prefix: Icons.person,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter a name' : null,
                      ),
                      SizedBox(height: 2.h),
                      MyFromField(
                        controller: _emailController,
                        lable: 'Email',
                        prefix: Icons.email,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter an email' : null,
                      ),
                      SizedBox(height: 2.h),
                      MyFromField(
                        controller: _phoneController,
                        lable: 'Phone Number',
                        prefix: Icons.phone,
                        validator: (value) => value!.isEmpty
                            ? 'Please enter a phone number'
                            : null,
                      ),
                      SizedBox(height: 2.h),
                      MyFromField(
                        controller: _addressController,
                        lable: 'Address',
                        prefix: Icons.home,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter an address' : null,
                      ),
                      SizedBox(height: 3.h),
                      MyButton(
                        height: 7.h,
                        width: double.infinity,
                        buttonColor: AppColors.primaryColor,
                        name: 'Add Contact',
                        onTap: _submitForm,
                        nameColor: AppColors.white,
                        borderColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
