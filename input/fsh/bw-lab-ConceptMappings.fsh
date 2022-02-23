Instance: BwLabPimsOrderStatusTaskCM
InstanceOf: ConceptMap
Description: "Mapping PIMS Lab Order Status to standard Task status value set."
Title: "PIMS Lab Order Status Task Mapping" // user-friendly name
Usage: #definition

* insert PublisherContextInstance
* name = "BwLabPimsOrderStatusTaskCM"
* sourceCanonical = Canonical(BwPimsLabOrderStatusVS)
* targetUri = $TaskStatus
* group[+].source = Canonical(BwPimsLabOrderStatusVS)
* group[=].target = $TaskStatus

* group[=].element[+].code = #ordered
* group[=].element[=].target[0].code = #requested
* group[=].element[=].target[0].equivalence = #equal

* group[=].element[+].code = #fully-drawn
* group[=].element[=].target[+].code = #in-progress
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #partially-resulted
* group[=].element[=].target[+].code = #in-progress
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #cancelled
* group[=].element[=].target[+].code = #cancelled
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #partially-drawn
* group[=].element[=].target[+].code = #in-progress
* group[=].element[=].target[=].equivalence = #equal

Instance: BwLabPimsOrderStatusRequestCM
InstanceOf: ConceptMap
Description: "Mapping PIMS Lab Order Status to standard ServiceRequest status value set."
Title: "PIMS Lab Order Service Request Status Mapping" // user-friendly name
Usage: #definition

* insert PublisherContextInstance
* name = "BwLabPimsOrderStatusRequestCM"
* sourceCanonical = Canonical(BwPimsLabOrderStatusVS)
* targetUri = $RequestStatus
* group[+].source = Canonical(BwPimsLabOrderStatusVS)
* group[=].target = $RequestStatus

* group[=].element[+].code = #ordered
* group[=].element[=].target[0].code = #active
* group[=].element[=].target[0].equivalence = #equal

* group[=].element[+].code = #fully-drawn
* group[=].element[=].target[0].code = #active
* group[=].element[=].target[0].equivalence = #equal

* group[=].element[+].code = #partially-resulted
* group[=].element[=].target[0].code = #active
* group[=].element[=].target[0].equivalence = #equal

* group[=].element[+].code = #cancelled
* group[=].element[=].target[0].code = #revoked
* group[=].element[=].target[0].equivalence = #equal

* group[=].element[+].code = #partially-drawn
* group[=].element[=].target[0].code = #active
* group[=].element[=].target[0].equivalence = #equal

Instance: BwLabPimsOrderStatusDiagnosticReportCM
InstanceOf: ConceptMap
Description: "Mapping PIMS Lab Order Status to standard DiagnosticReport status value set."
Title: "PIMS Lab Order Diagnostic Report Status Mapping" // user-friendly name
Usage: #definition

* insert PublisherContextInstance
* name = "BwLabPimsOrderStatusDiagnosticReportCM"
* sourceCanonical = Canonical(BwPimsLabOrderStatusVS)
* targetUri = $DiagnosticReportStatus
* group[+].source = Canonical(BwPimsLabOrderStatusVS)
* group[=].target = $DiagnosticReportStatus

* group[=].element[+].code = #ordered
* group[=].element[=].target[+].code = #unknown
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #fully-drawn
* group[=].element[=].target[+].code = #unknown
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #partially-resulted
* group[=].element[=].target[+].code = #partial
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #cancelled
* group[=].element[=].target[+].code = #cancelled
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #partially-drawn
* group[=].element[=].target[+].code = #unknown
* group[=].element[=].target[=].equivalence = #equal


Instance: BwPimsLabTestLoincCM
InstanceOf: ConceptMap
Description: "Mapping PIMS Lab Test Codes to LOINC."
Title: "PIMS tblkLabTest <-> LOINC" // user-friendly name
Usage: #definition

* insert PublisherContextInstance
* name = "BwPimsLabTestLoincCM"
* sourceCanonical = Canonical(BwPimsLabTestVS)
* targetUri = $LNC
* group[+].source = Canonical(BwPimsLabTestVS)
* group[=].target = $LNC

* group[=].element[+].code = #CD4
* group[=].element[=].target[+].code = $LNC#24467-3
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #CD4%
* group[=].element[=].target[+].code = $LNC#8123-2
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #VL
* group[=].element[=].target[+].code = $LNC#20447-9
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #PCV
* group[=].element[=].target[+].code = $LNC#1298-9
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #WBC
* group[=].element[=].target[+].code = $LNC#26464-8
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #NP%
* group[=].element[=].target[+].code = $LNC#32200-8
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #AST
* group[=].element[=].target[+].code = $LNC#1920-8
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #GGT
* group[=].element[=].target[+].code = $LNC#2324-2
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #ALPL
* group[=].element[=].target[+].code = $LNC#6768-6
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #LIP
* group[=].element[=].target[+].code = $LNC#3040-3
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #TGS
* group[=].element[=].target[+].code = $LNC#2571-8
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #Urea
* group[=].element[=].target[+].code = $LNC#3092-4
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #Na
* group[=].element[=].target[+].code = $LNC#2951-2
* group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #K
* group[=].element[=].target[+].code = $LNC#2823-3	
* group[=].element[=].target[=].equivalence = #equal

// https://loinc.org/search/?t=1&s=PCR+DNA
// * group[=].element[+].code = #PCR
// * group[=].element[=].target[+].code = $LNC#
// * group[=].element[=].target[=].equivalence = #equal

// https://loinc.org/search/?t=1&s=Ag
// * group[=].element[+].code = #Ag
// * group[=].element[=].target[+].code = $LNC#
// * group[=].element[=].target[=].equivalence = #equal

// * group[=].element[+].code = #CST
// * group[=].element[=].target[+].code = $LNC#
// * group[=].element[=].target[=].equivalence = #equal

* group[=].element[+].code = #MCV
* group[=].element[=].target[+].code = $LNC#30428-7
* group[=].element[=].target[=].equivalence = #equal

// * group[=].element[+].code = #Rapid
// * group[=].element[=].target[+].code = $LNC#
// * group[=].element[=].target[=].equivalence = #equal

