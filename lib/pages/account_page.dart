import 'package:flutter/material.dart';
class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Step> steps = [ 
  
     Step(
      title: const Text('Hello Bitch'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'How are you?'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'I hope you are well'),
          ),
        ],
      ),
    ),
    Step(
      isActive: true,
      state: StepState.complete,
      title: const Text('Son of Bitch'),
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'As for me,I am fine'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Blar Blar'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.complete,
      isActive: true,
      title: const Text('Fuck'),
      
      content: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Far a part form me'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'I need a weapon'),
          ),
        ],
      ),
    ),
  ];
    StepperType stepperType=StepperType.horizontal;
int currentStep =0;
bool complete = false;

next() {
  currentStep + 1 != steps.length
      ? goTo(currentStep + 1)
      : setState(() => complete = true);
}

cancel() {
  if (currentStep > 0) {
    goTo(currentStep - 1);
  }
}

goTo(int step) { 
  setState(() => currentStep = step);
}
   switchStepType(){
     setState(()=>stepperType==StepperType.horizontal
     ? stepperType=StepperType.vertical
     : stepperType=StepperType.horizontal);
   }
  @override
 Widget build(BuildContext context) {
  return new Scaffold(
    appBar: AppBar(
    title: Text('Create an account'),
    ),
    body: Column(
      
      children: <Widget>[
         Container(
                              width: 400.0,
                              child: Image(
                                  image: AssetImage('images/car.png')),
                            ),
         Expanded(
                child: Stepper(
                  steps: steps,
                  type: stepperType,
                  currentStep: currentStep,
                  onStepContinue: next,
                  onStepTapped: (step) => goTo(step),
                  onStepCancel: cancel,
                ),
              ),
      ], 
    ),
     
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.list),
      onPressed: switchStepType,
    ),
  );
}
  }