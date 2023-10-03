import 'package:finance_loan/frontend/widgets/create-loan/create_new_loan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('CreateNewLoan widget should build without errors', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const CreateNewLoan());

    // Verify that the widget is on the screen.
    expect(find.byType(CreateNewLoan), findsOneWidget);
  });

  testWidgets('Tapping the Save button triggers the save function', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const CreateNewLoan());

    // Tap the Save button.
    await tester.tap(find.text('Save'));

    // Verify that the save function was called.
    // You need to implement this check based on your code's logic.
    // Example: expect(saveFunctionCalled, true);
  });

  testWidgets('Input validation should show error messages for empty fields', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const CreateNewLoan());

    // Tap the Save button without filling in any data.
    await tester.tap(find.text('Save'));
    await tester.pump();

    // Verify that error messages are displayed for required fields.
    expect(find.text('Please enter the full name'), findsOneWidget);
    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Please enter the loan amount'), findsOneWidget);
    expect(find.text('Please enter your email'), findsOneWidget);
  });

  testWidgets('Selecting a date should update the loan date', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const CreateNewLoan());

    // Open the loan date picker.
    await tester.tap(find.byKey(const Key('loanDatePicker')));
    await tester.pumpAndSettle();

    // Select a date.
    await tester.tap(find.text('OK'));
    await tester.pump();

    // Verify that the loan date is updated.
    // You need to implement this check based on your code's logic.
    // Example: expect(loanDateUpdated, true);
  });

  testWidgets('Selecting an invalid due date should show an error message', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const CreateNewLoan());

    // Open the due date picker.
    await tester.tap(find.byKey(const Key('dueDatePicker')));
    await tester.pumpAndSettle();

    // Select an invalid date (before the loan date).
    await tester.tap(find.text('OK'));
    await tester.pump();

    // Verify that an error message is displayed.
    expect(find.text('Invalid due date. Please select a date after the loan date.'), findsOneWidget);
  });
}