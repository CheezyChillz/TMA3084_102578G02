import 'myLib.dart';

// Calculate overtime pay
double calculateOvertime(double hourlyRate, double hoursWorked) {
  double standardHours = 160.0;
  if (hoursWorked > standardHours) {
    double overtimeHours = hoursWorked - standardHours;
    return overtimeHours * (hourlyRate * 1.5);
  }
  return 0.0;
}

void main() {
  // Create an employee instance
  Employee emp = Employee(
    name: "John Doe",
    baseSalary: 4500.0,
    hourlyRate: 19.0,
    hoursWorked: 180.0,
  );

  // Calculate overtime pay and total salary
  double overtimePay = calculateOvertime(emp.hourlyRate, emp.hoursWorked);
  double totalSalary = emp.baseSalary + overtimePay;

  print("Total Salary = \$${totalSalary.toStringAsFixed(1)} USD");
}