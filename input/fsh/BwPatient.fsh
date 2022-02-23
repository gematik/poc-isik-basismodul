Profile:        BwPatient
Parent:         PatientUvIps
Id:             bw-patient
Title:          "Botswana Patient"
Description:    "A patient in a Botswana Health System"
* name 1..*
* identifier 1..*

Profile:        PimsPatient
Parent:         BwPatient
Id:             pims-patient
Title:          "PIMS Patient"
Description:    "A patient in a PIMS instance"
* name 1..*
* identifier 1..*
* managingOrganization 1..1
* managingOrganization only Reference(Organization)

Profile:        OmangPatient
Parent:         BwPatient
Id:             omang-patient
Title:          "Omang System Patient"
Description:    "A patient in the Omang system"
* maritalStatus 1..1 MS 
* birthDate 1..1 MS
* identifier 1..1 MS
* identifier.system = "http://moh.bw.org/ext/identifier/omang"
* identifier.value 1..1 MS

Profile:        BirthPlaceObservation
Parent:         Observation
Id:             birth-place-observation
Title:          "Birth Place"
Description:    "Describes a Birth Place in the Omang System"
* subject 1..1 MS
* subject only Reference(OmangPatient)
* code = $LNC#21842-0
* value[x] only string

// * component ^slicing.discriminator.type = #pattern
// * component ^slicing.discriminator.path = "code"
// * component ^slicing.rules = #open
// * component ^slicing.description = "Slice based on the component.code pattern"
// * component contains birthPlaceName 1..1 MS
// * component[birthPlaceName].code = $LNC#21842-0
// * component[birthPlaceName].value[x] only string
// * component[birthDistrictCode].code = $LNC#52830-7
// * component[birthDistrictCode].value[x] only integer
// * component[birthDistrictName].code = $LNC#80910-3
// * component[birthDistrictName].value[x] only string

Profile:        DeathCertificateObservation
Parent:         Observation
Id:             death-certificate-observation
Title:          "Death Certificate"
Description:    "Death Certificate in the Omang System"
* subject 1..1 MS
* subject only Reference(OmangPatient)
* code = $LNC#64297-5
* value[x] only string

// * component ^slicing.discriminator.type = #pattern
// * component ^slicing.discriminator.path = "code"
// * component ^slicing.rules = #open
// * component ^slicing.description = "Slice based on the component.code pattern"
// * component contains deathCertificateNumber 1..1 MS
// * component[deathCertificateNumber].code = $LNC#64297-5
// * component[deathCertificateNumber].value[x] only string
// * component[deceasedDate].code = $LNC#81954-0
// * component[deceasedDate].value[x] only dateTime
