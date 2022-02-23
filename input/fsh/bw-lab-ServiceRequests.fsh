Profile: BwServiceRequest
Parent: ServiceRequest
Id: bw-basic-service-request
Title: "Basic Botswana Lab Service Request"
Description: "A service request a lab order for for a given patient."
* code 1..1
* code.coding 1..*
* subject only Reference(BwPatient)
* encounter 0..1
* encounter only Reference(BwEncounter)
* performer 0..1
* performer only Reference(Organization)
* locationReference 0..1

Profile: BwPimsLabTest
Parent: BwServiceRequest
Id: bw-pims-lab-test-service-request
Title: "PIMS Lab Test Service Request"
Description: "A service request representing a PIMS lab test as part of a PIMS lab order."
* code 1..1
* code.coding 1..1
// * code.coding from 
* subject only Reference(PimsPatient)
* encounter 0..1
* encounter only Reference(BwEncounter)
* basedOn 1..*
* basedOn only Reference(BwPimsLabProfile)

Profile: BwPimsLabProfile
Parent: BwServiceRequest
Id: bw-pims-lab-profile-service-request
Title: "PIMS Lab Profile Service Request"
Description: "A service request representing a PIMS lab profile as part of a PIMS lab order."
* code 1..1
* code.coding 1..1
// * code.coding from 
* subject only Reference(PimsPatient)
* encounter 0..1
* encounter only Reference(BwEncounter)

