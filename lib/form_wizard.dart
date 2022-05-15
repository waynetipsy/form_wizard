// ignore_for_file: avoid_print, avoid_unnecessary_containers, duplicate_ignore

import 'package:flutter/material.dart';

class FormWizard extends StatefulWidget {
  const FormWizard({ Key? key }) : super(key: key);

  @override
  State<FormWizard> createState() => _FormWizardState();
}
class _FormWizardState extends State<FormWizard> {
   int _activeStepIndex = 0;

   TextEditingController firstName = TextEditingController();
   TextEditingController lastName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
     TextEditingController setPassWord = TextEditingController();
     TextEditingController state = TextEditingController();
     TextEditingController town = TextEditingController();
     TextEditingController city = TextEditingController();

   List<Step> stepList()=> [
      Step(
       state: _activeStepIndex <= 0 ?StepState.editing :StepState.complete,
       isActive: _activeStepIndex >=0,
       title: const Text('Personal Info'), 
       content: Container(
         child: Column(children: [
           TextField(
             controller: firstName,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'First Name'
               ),
           ),
          const SizedBox(height: 10),

          TextField(
             controller: lastName,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Last Name',
               ),
           ),
          const SizedBox(height: 10),

          TextField(
             controller: email,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Email'
               ),
           ),
           const SizedBox(height: 10),
           TextField(
             controller: phoneNumber,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Phone Number'
               ),
           ),
              const SizedBox(height: 10),
           TextField(
             controller: setPassWord,
             obscureText: true,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Set Password'
               ),
           ),
           const SizedBox(height: 40.0,)

         ]),
       )
 ),
     
      Step(
      state:  _activeStepIndex <= 1 ?StepState.editing :StepState.complete,
      isActive: _activeStepIndex >=1,
      title: const Text('Address'), 
     // ignore: avoid_unnecessary_containers
     content: Container(
    child: Column(
        children: [
          const SizedBox(height: 8,),
             TextField(
             controller: state,
             obscureText: true,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'State'
               ),
           ),
        const SizedBox(height: 10),
         TextField(
             controller: town,
             obscureText: true,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'Town'
               ),
           ),
             const SizedBox(height: 10),
           TextField(
             controller: city,
             obscureText: true,
             decoration: const InputDecoration(
               border: OutlineInputBorder(),
               labelText: 'City'
               ),
           ),
           const SizedBox(height: 40),

    ],)
  )),

   Step(
     state: StepState.complete,
     isActive: _activeStepIndex >=2,
     title: const Text('Confirm'),
    content: Container(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       Text('FirstName: ${firstName.text}'),
       const SizedBox(height: 5.0),
        Text('LastName: ${lastName.text}'),
         const SizedBox(height: 5.0),
        Text('Email : ${email.text}'),
         const SizedBox(height: 5.0),
        Text('Phone Number : ${phoneNumber.text}'),
        const SizedBox(height: 5.0),
        const Text('Password: *********'),
         const SizedBox(height: 5.0),
        Text('State: ${state.text}'),
         const SizedBox(height: 5.0),
        Text('Town: ${town.text}'),
         const SizedBox(height: 5.0),
        Text('City: ${city.text}'),

        const SizedBox(height: 50.0),

      ]
    ),
    ),
   ),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Wizard'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
    onStepContinue: () {
      if(_activeStepIndex <(stepList().length - 1)) {
      setState(() {
      _activeStepIndex += 1;
      });
    } else {
      print('Submited');
    }
  },
  
    onStepCancel: () {
      if(_activeStepIndex == 0) {
         return;
      }
      setState(() {
       _activeStepIndex -= 1; 
      });
    },

    onStepTapped: (int index) {
      setState(() {
        _activeStepIndex = index;
      });
    },
      // ignore: non_constant_identifier_names
      controlsBuilder: (BuildContext context, ControlsDetails controls) {
          final isLastStep = _activeStepIndex == stepList().length - 1;
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controls.onStepContinue,
                    child: (isLastStep)
                        ? const Text('Submit')
                        : const Text('Next'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_activeStepIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controls.onStepCancel,
                      child: const Text('Back'),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}