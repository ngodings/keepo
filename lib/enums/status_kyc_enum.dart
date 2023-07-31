enum StatusKYC {
  notSet('Not Set'),
  pendingReview('Pending Review'),
  pendingSubmission('Pending Submission'),
  pending('On Hold'),
  rejected('KYC Failed'),
  reviewed('KYC Reviewed');

  const StatusKYC(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertKYCStatus on String {
  StatusKYC toEnum() {
    switch (this) {
      case 'Not Set':
        return StatusKYC.notSet;
      case 'Pending Review':
        return StatusKYC.pendingReview;
      case 'Pending Submission':
        return StatusKYC.pendingSubmission;
      case 'On Hold':
        return StatusKYC.pending;
      case 'KYC Failed':
        return StatusKYC.rejected;
      case 'KYC Reviewed':
        return StatusKYC.reviewed;
      default:
        return StatusKYC.notSet;
    }
  }
}
