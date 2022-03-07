Profile: BwLabDiagnosticReport
Parent: DiagnosticReportUvIps
Id: bw-lab-diagnostic-report
Title: "Botswana Lab Diagnostic Report"
Description: "DiagnosticReport resource that holds the results of a lab order"
* code.coding 1..*
* result only Reference(BwLabObservation)