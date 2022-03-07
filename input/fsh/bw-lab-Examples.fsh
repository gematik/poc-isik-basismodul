/* 
========================================================== EXAMPLES ==========================================================
==============================================================================================================================
*/

Instance: example-pims-patient
InstanceOf: BwPatient 
Usage: #example 
Description: "Example PIMS Patient"
Title:   "PIMS Patient"
* name.use = #official
* name.family = "PimsPatient"
* name.given[+] = "Test"
* gender = #female
* birthDate = "1988-03-02"
* identifier[+].value = "urn:uuid:<Pims-specific Patient ID>"
* identifier[=].system = "urn:ietf:rfc:3986"
* identifier[=].type = #MR
* identifier[+].value = "<OmangNumber>"
* identifier[=].system = "http://moh.bw.org/ext/identifier/omang"
* identifier[=].use = #official
* managingOrganization = Reference(example-facility-order-creator)

Instance: example-ipms-patient
InstanceOf: BwPatient 
Usage: #example 
Description: "Example IPMS Patient"
Title:   "IPMS Patient"
* name.use = #official
* name.family = "IpmsPatient"
* name.given[+] = "Demo"
* gender = #male
* birthDate = "1948-01-22"
* identifier[+].value = "urn:uuid:<IPMS Patient ID>"
* identifier[=].system = "urn:ietf:rfc:3986"
* identifier[=].type = #MR
* identifier[+].value = "<OmangNumber>"
* identifier[=].system = "http://moh.bw.org/ext/identifier/omang"
* identifier[=].use = #official
* managingOrganization = Reference(example-facility-order-reciever)

Instance: example-pims-patient-international
InstanceOf: BwPatient 
Usage: #example 
Description: "Example International Botswana Patient"
Title:   "BW Patient"
* name.family = "Patient"
* name.given[+] = "BwTest"
* gender = #female
* birthDate = "1988-03-02"
* identifier.value = "urn:uuid:<Pims-specific Patient ID>"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "<PassportNumber>"
* identifier.type = #PPN

// mCSD Location & Facility
Instance: example-facility-order-creator
// InstanceOf: MCSDFacilityOrganization
InstanceOf: Organization
Title: "PIMS Facility"
Usage: #example
Description: "Example PIMS Facility"
* identifier[+].value = "<pims-facility-code>"
* identifier[=].system = "http://moh.bw.org/ext/mfl/facility-code"
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #prov
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* active = true

Instance: example-location-order-creator
// InstanceOf: MCSDFacilityLocation
InstanceOf: Location
Title: "PIMS Location"
Usage: #example
Description: "Example PIMS Facility Location"
* status = #active
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #HOSP
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* physicalType = #bu
* managingOrganization = Reference(example-facility-order-creator)

Instance: example-facility-order-reciever
// InstanceOf: MCSDFacilityOrganization
InstanceOf: Organization
Title: "IPMS Facility"
Usage: #example
Description: "Example IPMS Facility"
* identifier[+].value = "MOH001"
* identifier[=].system = "http://moh.bw.org/ext/mfl/facility-code"
* active = true

Instance: example-location-order-reciever
// InstanceOf: MCSDFacilityLocation
InstanceOf: Location
Title: "IPMS Location"
Usage: #example
Description: "Example IPMS Facility Location"
* status = #active
* type[+].coding[+].system = "urn:ietf:rfc:3986"
* type[=].coding[=].code = #HLAB
* type[+].coding[+].system = "https://github.com/ihe/ITI.mCSD"
* type[=].coding[=].code = #Facility
* physicalType = #bu
* managingOrganization = Reference(example-facility-order-reciever)

Instance: example-bw-task-requested
InstanceOf: BwLabTask 
Usage: #example 
Description: "Example Task for Requested Lab Orders and Results in Botswana"
Title:   "BW Requested Lab Task"
* identifier.value = "PimsSpecificLabOrderID"
* identifier.system = "http://<pims-instance-specific-url>/ext/lab-task/identifier"   
* basedOn[+] = Reference(example-bw-pims-service-request-1)
* basedOn[+] = Reference(example-bw-pims-service-request-2)
* status = #requested
* intent = #order
* for = Reference(example-pims-patient)
* authoredOn = "2021-05-20"
* owner = Reference(example-facility-order-reciever)
* location = Reference(example-location-order-creator)

Instance: example-bw-pims-service-request-profile
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Profile"
Title: "BW PIMS ServiceRequest Profile"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-profile-code"
* code.coding[=].code = #pims-profile-code
* subject = Reference(example-pims-patient)
* performer = Reference(example-facility-order-reciever)
* locationReference = Reference(example-location-order-reciever)

Instance: example-bw-pims-service-request-1
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Lab Order"
Title: "BW PIMS ServiceRequest 1"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-test-code"
* code.coding[=].code = #pims-labtest-code
* basedOn[+] = Reference(example-bw-pims-service-request-profile)
* subject = Reference(example-pims-patient)
* performer = Reference(example-facility-order-reciever)
* locationReference = Reference(example-location-order-reciever)

Instance: example-bw-pims-service-request-2
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a PIMS Lab Order"
Title: "BW PIMS ServiceRequest 2"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-test-code"
* code.coding[=].code = #pims-labtest-code
* basedOn[+] = Reference(example-bw-pims-service-request-profile)
* subject = Reference(example-pims-patient)
* performer = Reference(example-facility-order-reciever)
* locationReference = Reference(example-location-order-reciever)

Instance: example-bw-pims-practitioner
InstanceOf: BwPractitioner
Usage: #example
Description: "Example PIMS Practitioner"
Title: "BW PIMS Practitioner"
* name.family = "Provider"
* name.given[+] = "PIMS"
* identifier[+].value = "RequesterID"
* identifier[=].system = "http://<pims-instance-specific-url>/ext/practitioner/identifier"   


Instance: example-bw-lab-composition
InstanceOf: BwLabComposition
Usage: #example
Description: "Example Lab Order Composition"
Title: "Example PIMS Lab Composition"
* type = #document
* subject = Reference(example-pims-patient)
* date = "2021-06-06"
* author = Reference(example-bw-practitioner)
* section[labTask].entry[+] = Reference(example-bw-task-requested)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-profile)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-1)
* section[labOrders].entry[+] = Reference(example-bw-pims-service-request-2)


Instance: example-bw-lab-bundle
InstanceOf: Bundle
Usage: #example
Description: "Example Full PIMS Lab Bundle"
Title: "Example Lab Bundle"
* type = #document
* entry[+].resource = example-bw-lab-composition
* entry[+].resource = example-pims-patient
* entry[+].resource = example-bw-pims-practitioner
* entry[+].resource = example-bw-task-requested
* entry[+].resource = example-bw-pims-service-request-profile
* entry[+].resource = example-bw-pims-service-request-1
* entry[+].resource = example-bw-pims-service-request-2
* entry[+].resource = example-facility-order-creator
* entry[+].resource = example-location-order-creator
* entry[+].resource = example-facility-order-reciever
* entry[+].resource = example-location-order-reciever

Instance: example-bw-lab-results-bundle
InstanceOf: Bundle
Usage: #example
Description: "Example IPMS Results Lab Bundle translated from HL7 ORU message"
Title: "Example IPMS Results Lab Bundle"
* type = #transaction
* entry[+].resource = example-ipms-patient
* entry[=].request.method = #PUT
* entry[=].request.url = "Patient/example-ipms-patient"
* entry[+].resource = example-bw-ipms-service-request
* entry[=].request.method = #PUT
* entry[=].request.url = "ServiceRequest/example-bw-ipms-service-request"
* entry[+].resource = example-bw-ipms-diagnostic-report
* entry[=].request.method = #PUT
* entry[=].request.url = "DiagnosticReport/example-bw-ipms-diagnostic-report"
* entry[+].resource = example-bw-ipms-obs-1
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/example-bw-ipms-obs-1"
* entry[+].resource = example-bw-ipms-obs-2
* entry[=].request.method = #PUT
* entry[=].request.url = "Observation/example-bw-ipms-obs-2"

Instance: example-bw-ipms-service-request
InstanceOf: BwServiceRequest
Usage: #example
Description: "Example ServiceRequest resource representing a IPMS Lab Order"
Title: "BW PIMS ServiceRequest 2"
* status = #active
* intent = #order
* code.coding[+].system = "http://moh.bw.org/ext/laboratory/pims-lab-test-code"
* code.coding[=].code = #COVID
* code.coding[=].display = "SARS-CoV-2 PCR"
* subject = Reference(example-ipms-patient)

// IPMS Resulting
Instance: example-bw-ipms-diagnostic-report
InstanceOf: BwLabDiagnosticReport
Usage: #example
Description: "Example Laboratory DiagnosticReport"
Title: "Laboratory DiagnosticReport"
* code.coding[+].system = "L"
* code.coding[=].code = #COVID
* code.coding[=].display = "SARS-CoV-2 PCR"
* category[+].coding[+].code = #LAB
* identifier[+].type.coding[+].code = #FILL
* identifier[=].type.coding[+].system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* effectiveDateTime = "2021-06-03T14:00:00.000Z"
* subject.reference = "example-ipms-patient" 
* subject.type = "Patient"
* result[+] = Reference(example-bw-ipms-obs-1)
* result[=].type = "Observation"
* result[+] = Reference(example-bw-ipms-obs-2)
* result[=].type = "Observation"
* status = #final

Instance: example-bw-ipms-obs-1
InstanceOf: BwLabObservation
Usage: #example
Description: "Example IPMS Observation"
Title: "IPMS Observation #1"
* code.coding[+].system = "L"
* code.coding[=].code = #COVID
* code.coding[=].display = "SARS-CoV-2 PCR"
* valueString = "INCONCLUSIVE"
* interpretation[+].coding[+].code = #N
* interpretation[=].coding[=].display = "Normal"
* interpretation[=].coding[=].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* subject = Reference(example-ipms-patient)
* subject.type = "Patient"
* status = #final
* effectiveDateTime = "2021-06-10T15:49:00.000Z"
* performer = Reference(example-facility-order-reciever)

Instance: example-bw-ipms-obs-2
InstanceOf: BwLabObservation
Usage: #example
Description: "Example IPMS Observation"
Title: "IPMS Observation #2"
* code.coding[+].system = "L"
* code.coding[=].code = #S-Cov-2-RVW
* code.coding[=].display = "SARS-CoV-2 PCR REVIEW"
* valueString = "."
* interpretation[+].coding[+].code = #N
* interpretation[=].coding[=].display = "Normal"
* interpretation[=].coding[=].system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
* subject = Reference(example-ipms-patient)
* subject.type = "Patient"
* status = #final
* effectiveDateTime = "2021-06-10T15:49:00.000Z"
* performer = Reference(example-facility-order-reciever)

Instance: example-omang-patient
InstanceOf: OmangPatient
Usage: #example
Description: "Omang Patient"
Title: "Omang Patient"
* name.use = #official
* name.family = "<FIRST_NME>"
* name.given[+] = "<SURNME>"
* gender = #female
* birthDate = "2000-01-01"
* identifier[+].value = "<ID_NO>"
* identifier[=].system = "http://moh.bw.org/ext/identifier/omang"
* identifier[=].use = #official
* deceasedDateTime = "2010-01-01"
* maritalStatus = #M // "MARITAL_STATUS_CDE - see <https://www.hl7.org/fhir/valueset-marital-status.html>"
* address[+].district = "<DISTRICT_NME>"
* address[=].postalCode = "<DISTRICT_CDE>"

Instance: example-birth-place
InstanceOf: BirthPlaceObservation
Usage: #example
Description: "Birth Place for Patient"
Title: "Birth Place"
* subject = Reference(example-omang-patient)
* component[+].code = $LNC#21842-0
* component[=].valueString = "<BIRTH_PLACE_NME>"
* status = #final

Instance: example-death-cert
InstanceOf: DeathCertificateObservation
Usage: #example
Description: "Death Certificate Information for Patient"
Title: "Death Certificate"
* subject = Reference(example-omang-patient)
* component[+].code = $LNC#64297-5
* component[=].valueString = "<DEATH_CERT_NO>"
* status = #final
