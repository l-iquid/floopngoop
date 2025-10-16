
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_training_template/core_state.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SinglePeriodEnforcer extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if ('.'.allMatches(newText).length <= 1) {
      return newValue;
    }
    return oldValue;
  }
}

class BankPage extends StatefulWidget {
  const BankPage({super.key});

  @override
  State<StatefulWidget> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  double moneyFieldValue = 0;
  double loanFieldValue = 0;

  @override
  Widget build(BuildContext context) {
    final coreState = Provider.of<CoreState>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Welcome ${coreState.signedInAccountName}!", textScaler: TextScaler.linear(2)),
            SizedBox(height: 20),
            Text("Money: \$${coreState.money}", textScaler: TextScaler.linear(1.5)),
            SizedBox(height: 10),

            SizedBox(width: 250, child: TextField(
              decoration: InputDecoration(
                hintText: "Money amount...",
                labelText: "Money Prompt",
              ),
              maxLines: 1,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                SinglePeriodEnforcer(),
              ],

              onChanged: (value) => moneyFieldValue = double.tryParse(value) ?? 0,
            )),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              OutlinedButton(
                onPressed: () => coreState.setMoney(coreState.money + moneyFieldValue),
                child: Text('Deposit')
              ),
              OutlinedButton(
                onPressed: () => coreState.setMoney(coreState.money - moneyFieldValue),
                child: Text('Withdraw')
              ),

            ]),

            SizedBox(height: 20),

            /* loans */
            Text('Loans', textScaler: TextScaler.linear(2)),
            Text('${coreState.loans.length} loans active'),
            SizedBox(width: 250, child: TextField(
              decoration: InputDecoration(
                hintText: "Loan money amount...",
                labelText: "Loan Prompt",
              ),
              maxLines: 1,
              keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),
                SinglePeriodEnforcer(),
              ],

              onChanged: (value) => loanFieldValue = double.tryParse(value) ?? 0,
            )),

            OutlinedButton(
              onPressed: () {
                if (loanFieldValue == 0) {
                  return;
                }
                coreState.newLoan(loanFieldValue);
                coreState.setMoney(coreState.money + (coreState.loans.lastOrNull ?? 0));
              },
              child: Text('Loan me money')
            ),

            
            OutlinedButton(
              onPressed: () {
                coreState.setMoney(coreState.money - (coreState.loans.lastOrNull ?? 0));
                coreState.popLoan();
              },
              child: Text('Remove loan (current ${coreState.loans.lastOrNull ?? 0})')
            ),
            

            

            SizedBox(height: 100),
            ElevatedButton(onPressed: () {
              coreState.resetStates();
              context.go('/');
            }, child: Text('Delete Account',
                style: TextStyle(
                  color: Color.fromRGBO(255, 0, 0, 1)
                )
            )),

          ],
        ),
      )
    );
  }
}