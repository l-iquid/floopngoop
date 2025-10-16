import 'package:flutter/material.dart';
import 'package:flutter_training_template/core_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}


class _CreateAccountPageState extends State<CreateAccountPage> {
  String username = "";
  String password = "";
  bool tosAgreement = false;

  SizedBox usernameField() {
    return SizedBox(width: 250,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Account username...",
          labelText: "Username",
          
        ),
        maxLines: 1,
        maxLength: 20,
        onChanged: (value) => setState(() => username = value),
      ),
    );
  }

  SizedBox passwordField() {
    return SizedBox(width: 250,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Password...",
          labelText: "Password",
          
        ),
        maxLines: 1,
        maxLength: 20,
        obscureText: true,
        onChanged: (value) => setState(() => password = value),
      ),
    );
  }
  
  OutlinedButton createAccountButton(BuildContext context) {
    final coreState = Provider.of<CoreState>(context, listen: false);

    return OutlinedButton(onPressed: () {
      if (username.isEmpty || password.isEmpty || !tosAgreement) {
        return;
      }

      coreState.resetStates();
      coreState.setSignedInAccount(username);
      context.go('/bank');
    }, child: Text('Create Account'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.all(12.0)),
            
            Row(spacing: 10, mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(children: [
                Text("Bank Blast!", textScaler: TextScaler.linear(2)),
                Text("Bank while blasting in Block Blast."),
              ]),
              SizedBox(height: 10),
              Image(image: AssetImage("lib/assets/images/blockblast.jpg"), width: 180, height: 180),
            ]),

            SizedBox(height: 50),

            Text("You do not have an account."),
            Text("Create Account", textScaler: TextScaler.linear(1.5)),
            usernameField(),
            passwordField(),

            SizedBox(height: 10),

            SizedBox(width: 350, child: 
              CheckboxListTile(
                title: const Text("I agree to the Terms of Service."),
                value: tosAgreement,
                onChanged: (bool? newValue) {
                  setState(() {
                    tosAgreement = newValue ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              )
            ),
            
            ElevatedButton(onPressed: () {
              context.go('/tos');
            }, child: Text('View Terms of Service')),

            SizedBox(height: 10),
            createAccountButton(context),
            SizedBox(height: 60),
            Text("Play Block Blast at https://blockblast.org/ for less interest!")
          ],
        ),
      ),
    );
  }
}
