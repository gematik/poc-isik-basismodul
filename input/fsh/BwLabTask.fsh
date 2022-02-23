Profile: BwLabTask
Parent: Task
Id: bw-lab-task
Title: "Botswana Lab Task Resource"
Description: "A Task resource for tracking order state and synchronizing Lab Order communication in Botswana"
* identifier 1..*
* basedOn 1..*
* basedOn only Reference(BwServiceRequest)
* for only Reference(BwPatient)
* encounter only Reference(BwEncounter)
* owner 0..1
* owner only Reference(Organization)
* location 1..1
* location only Reference(Location)
* status from BwPimsLabOrderStatusVS
* intent from BwLabTaskIntentVS
* output.type.text = "DiagnosticReport"
* output.value[x] only Reference(BwLabDiagnosticReport)


