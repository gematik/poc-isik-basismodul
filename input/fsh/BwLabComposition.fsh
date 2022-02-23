Profile: BwLabComposition
Parent: http://hl7.org/fhir/StructureDefinition/clinicaldocument
Id: bw-lab-composition
Title: "Botswana Lab Order Composition"
Description: "This composition packages information needed to facilitate lab order communication between clinical systems in Botswana."
* status = #active
* subject 1..1      //there must be a subject
* subject only Reference(BwPatient)
* author 1..1
* author only Reference(BwPractitioner)
* title = "BW Lab Order Composition"
// * purpose = "Define communication between clinical systems in the Botswana HIE"

//discriminator for the sections - slice on the section code...
* section ^slicing.discriminator.type = #type
* section ^slicing.discriminator.path = "entry"
* section ^slicing.rules = #open

* section contains 
    labTask 1..1 and
    labOrders 0..* and 
    labResults 0..* 

* section 1..*
* section.section 0..0          //can't have sub sections
* section.emptyReason 0..0      //and no empty reason on the sections

* section[labTask].title = "Lab Task"
* section[labTask].entry only Reference(BwLabTask)
* section[labTask].entry MS

* section[labOrders].title = "Lab Orders"
* section[labOrders].entry only Reference(BwServiceRequest)
* section[labOrders].entry MS

* section[labResults].title = "Results"
* section[labResults].entry only Reference(BwLabDiagnosticReport)
* section[labResults].entry MS

