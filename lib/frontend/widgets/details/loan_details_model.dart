class LoanDetails {
  final String userId;
  final String fullName;
  final String imageUrl;
  final String phoneNumber;
  final String email;
  final String loanType;
  final double loanAmount;
  final DateTime createdAt;
  final DateTime loanDate;
  final DateTime dueDate;
  final String description;
  final String documentId;

  LoanDetails({
    required this.userId,
    required this.fullName,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
    required this.loanType,
    required this.loanAmount,
    required this.createdAt,
    required this.dueDate,
    required this.description,
    required this.loanDate,
    required this.documentId,
  });
}
