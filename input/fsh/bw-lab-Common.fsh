Alias: $LNC = http://loinc.org
Alias: $TaskStatus = http://hl7.org/fhir/ValueSet/task-status
Alias: $RequestStatus = http://hl7.org/fhir/ValueSet/request-status
Alias: $DiagnosticReportStatus = http://hl7.org/fhir/ValueSet/diagnostic-report-status

RuleSet: PublisherContextInstance
* status = #draft
* experimental = true
* publisher = "BTECH-BW"
* contact[0].name = "Piotr Mankowski"
* contact[0].telecom[0].system = #email
* contact[0].telecom[0].value = "pmanko@uw.edu"
* contact[0].telecom[0].use = #work

RuleSet: PublisherContextDefinitional
* ^status = #draft
* ^experimental = true
* ^publisher = "BTECH-BW"
* ^contact[0].name = "Piotr Mankowski"
* ^contact[0].telecom[0].system = #email
* ^contact[0].telecom[0].value = "pmanko@uw.edu"
* ^contact[0].telecom[0].use = #work
