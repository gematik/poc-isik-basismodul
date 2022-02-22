
Profile: ISiKBerichtBundle
Parent: Bundle
Id: ISiKBerichtBundle
Title: "ISiKBerichtBundle"
Description: "A document style representation of the receipt (complete, self-contained, signed)"
* ^meta.lastUpdated = "2020-04-16T13:42:23.761+00:00"
* ^version = "1.0.0"
* ^status = #draft
* ^date = "2020-11-23T13:42:21.4495435+00:00"
* obeys ISiK-docBundle-1
* type = #document (exactly)
* type MS
* timestamp 1.. MS
* entry MS
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "resource.type.coding.code"
  * ^slicing.rules = #open
* entry contains Composition 1..1 MS
* entry[Composition].resource only ISiKBerichtSubSysteme




// Code is working
Profile: ISiKBerichtSubSysteme
Parent: Composition
Id: ISiKBerichtSubSysteme
Description: "Dieses Profil ermöglicht die Krankenhaus-interne Übermittlung eines Berichtes in Form eines Dokumentes, die in ISiK Szenarien von Subsystemen an Primärsysteme gesendet werden."
* ^status = #active
* id 1..
* text 1.. MS
  * status = #extensions (exactly)
  * status MS
  * div MS
* identifier 1..
  * system 1..
  * value 1..
* status = #final (exactly)
* type.coding 1..
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* type.coding contains
    LOINC ..1 and
    KDL ..1 and
    IHE ..1
* type.coding[LOINC] = $loinc#55112-7
* type.coding[LOINC]
  * system 1..
  * system = "http://loinc.org" (exactly)
  * code 1..
* type.coding[KDL] ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1..
  * system = "http://dvmd.de/fhir/CodeSystem/kdl" (exactly)
  * code 1..
    * obeys kdl-1
* type.coding[IHE] ^patternCoding.system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode"
  * system 1..
  * system = "http://ihe-d.de/CodeSystems/IHEXDStypeCode" (exactly)
  * code 1..
* category.coding ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* category.coding ^slicing.rules = #open
* category.coding contains
    LOINC ..1 and
    IHE ..1
* category.coding[LOINC].system 1..
* category.coding[LOINC].system = "http://loinc.org" (exactly)
* category.coding[LOINC].code 1..
* category.coding[IHE].system 1..
* category.coding[IHE].system = "http://ihe-d.de/CodeSystems/IHEXDSclassCode" (exactly)
* category.coding[IHE].code 1..
* subject 1.. MS
* subject only Reference(ISiKPatient)
  * reference 1.. MS
* encounter 1.. MS
* encounter only Reference(ISiKKontaktGesundheitseinrichtung)
  * reference 1.. MS
* date MS
* author only Reference(PractitionerRole or Device or Organization or ISiKAngehoeriger or ISiKPatient or ISiKPersonImGesundheitsberuf)
  * display 1.. MS
* title MS
* section 1.. MS
  * title 1.. MS
  * text 1.. MS
  * section MS


// Code is working
Profile: ISiKDiagnose
Parent: Condition
Id: ISiKDiagnose
Description: "Dieses Profil ermöglicht die Nutzung von Diagnosen in ISiK Szenarien."
* insert Meta
* obeys isik-con1
* id MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains $condition-related named ReferenzPrimaerdiagnose 0..1 MS
* clinicalStatus MS
* code 1.. MS
  * obeys icd-text-1
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      ICD-10-GM 0..1 MS and
      Alpha-ID 0..1 MS and
      SNOMED-CT 0..1 MS and
      Orphanet 0..1 MS
  * coding[ICD-10-GM] only CodingICD10GM
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
    * extension[Mehrfachcodierungs-Kennzeichen] MS
    * extension[Seitenlokalisation] MS
    * extension[Diagnosesicherheit] MS
  * coding[Alpha-ID] only CodingAlphaID
    * ^patternCoding.system = "http://fhir.de/CodeSystem/alpha-id"
    * system 1.. MS
    * code 1.. MS
  * coding[SNOMED-CT] from $diagnoses-sct (required)
    * ^patternCoding.system = "http://snomed.info/sct"
    * system 1.. MS
    * code 1.. MS
  * coding[Orphanet] ^patternCoding.system = "http://www.orpha.net"
    * system 1.. MS
    * code 1..
* subject MS
  * reference 1.. MS
* encounter MS
* onset[x] only dateTime or Period
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #closed
* onsetPeriod only Period
  * ^sliceName = "onsetPeriod"
  * start.extension contains ExtensionLebensphase named Lebensphase-Start 0..1
  * end.extension contains ExtensionLebensphase named Lebensphase-Ende 0..1
* onsetDateTime only dateTime
  * ^sliceName = "onsetDateTime"
* recordedDate 1.. MS
* note MS




// Code is working
Profile: ISiKVersicherungsverhaeltnisGesetzlich
Parent: http://fhir.de/StructureDefinition/coverage-de-basis
Id: ISiKVersicherungsverhaeltnisGesetzlich
Description: "Dieses Profil ermöglicht die Darstellung eines gesetzlichen Versicherungsverhältnisses in ISiK Szenarien."
* insert Meta
* . ^definition = "Kostenübernahme im Rahmen eines gesetzlichen Versicherungsverhältnisses in Deutschland."
* id 1..
* identifier MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "system"
  * ^slicing.rules = #open
  * ^short = "Primärer Identifier der Versicherung"
  * ^definition = "Ein gesetzliches Versicherungsverhältnis sollte stets durch die eindeutige 30-stellige Versichertennummer identifiziert werden. Ist diese nicht bekannt, so wird die 10-stellige VersichertenID statt dessen verwendet."
* identifier contains KrankenversichertenID 1..1 MS
* identifier[KrankenversichertenID] only IdentifierKvid10
  * system MS
  * value MS
* status MS
* type MS
  * ^comment = "28.07.2017 (zulip): TC Konsens bzgl. Verwendung eines eigenen ValueSets anstelle des im Standrad definierten preferred bindings, da die dortigen Codes nicht passen."
  * coding 1.. MS
    * system 1.. MS
    * system = "http://fhir.de/CodeSystem/versicherungsart-de-basis" (exactly)
    * code 1.. MS
    * code = #GKV (exactly)
* subscriber only Reference(ISiKAngehoeriger)
  * ^definition = "Hauptversicherte Person, wenn abweichend von beneficiary, z.B. bei Familienversicherung"
  * identifier 1..
  * identifier only IdentifierKvid10
    * ^short = "VersichertenID (10-stellig) des Hauptversicherten"
    * ^patternIdentifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
  * display ^short = "Name des Hauptversicherten"
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * ^definition = "Benennt die versicherte Person."
  * ^comment = "Die Angabe der 10-stelligen Krankenversichertennummer ist verpflichtend. Durch die Referenz auf eine Patient-Resource können weitere Informationen zum Patienten hinterlegt werden."
  * reference 1.. MS
  * identifier ^short = "Identifier der versicherten Person"
    * ^patternIdentifier.system = "http://fhir.de/NamingSystem/gkv/kvid-10"
  * display ^short = "Name der Versicherten Person"
    * ^definition = "Die Angabe des Namens des Versicherten dient der geeigenten Darstellung für den Benutzer und hat keine technische Bedeutung."
* period
  * start ^mapping.identity = "KVDT" 
  * start ^mapping.map = "4133" 
  * end ^mapping.identity = "KVDT" 
  * end ^mapping.map = "4110"
* payor ..1 MS
* payor only Reference(Organization)
  * ^definition = "Gibt den Kostenträger des Versicherten an. Die Angabe der IK-Nummer als logische Referenz sowie des Namens als Display ist zwingend erforderlich.\r\nDie Referenz auf eine Resource vom Typ Organization, die weitere Details zur Versicherung enthalten kann (z.B. Adresse, Kontaktdaten) ist optional.\r\nSofern eine zweite Referenz auf einen Kostenträger existiert, so handelt es sich hierbei um den abrechnenden Kostenträger"
  * ^comment = "Die Angabe der IK-Nummer des Versicherers in payor.identifier ist verpflichtend. Weitere Angaben zum Versicherer (Name, Adresse) können in einer Organization-Resource hinterlegt werden, auf die hier referenziert wird."
  * identifier only IdentifierIknr
  * identifier MS
    * system MS
    * value MS
  * display 1.. MS



// Code is working
Profile: ISiKVersicherungsverhaeltnisSelbstzahler
Parent: Coverage
Id: ISiKVersicherungsverhaeltnisSelbstzahler
Description: "Dieses Profil ermöglicht Selbstzahler Szenarien in ISiK."
* insert Meta
* status ^mustSupport = false
* type 1..
  * coding 1..
    * system 1..
    * system = "http://fhir.de/CodeSystem/versicherungsart-de-basis" (exactly)
    * code 1..
    * code = #SEL (exactly)
* policyHolder ..0
* subscriber only Reference(ISiKPatient or ISiKAngehoeriger)
* subscriber MS
  * display 1.. MS
* subscriberId ..0
* beneficiary only Reference(ISiKPatient)
* beneficiary MS
  * reference 1.. MS
* payor only Reference(ISiKPatient or ISiKAngehoeriger)
* payor MS
* order ..0
* network ..0




// Code is working
Profile: ISiKKontaktGesundheitseinrichtung
Parent: Encounter
Id: ISiKKontaktGesundheitseinrichtung
Description: "Dieses Profil ermöglicht die Herstellung eines Fallbezuges welcher in der Mehrheit der ISiK Szenarien im Krankenhaus essentiell ist."
* ^status = #active
* obeys ISiK-enc-1
* id 1.. MS
* extension ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "url"
  * ^slicing.rules = #open
* extension contains $Aufnahmegrund named Aufnahmegrund 0..1 MS
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[0].path = "url"
  * ^slicing.rules = #open
* extension[Aufnahmegrund].extension[ErsteUndZweiteStelle] ^sliceName = "ErsteUndZweiteStelle"
  * ^mustSupport = true
* extension[Aufnahmegrund].extension[DritteStelle] ^sliceName = "DritteStelle"
  * ^mustSupport = true
* extension[Aufnahmegrund].extension[VierteStelle] ^sliceName = "VierteStelle"
  * ^mustSupport = true
* identifier 1.. MS
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* identifier contains Aufnahmenummer ..1 MS
* identifier[Aufnahmenummer] ^patternIdentifier.type = $v2-0203#VN
  * type MS
    * coding MS
      * ^slicing.discriminator[0].type = #pattern
      * ^slicing.discriminator[0].path = "$this"
      * ^slicing.rules = #open
    * coding contains vn-type 1..1 MS
    * coding[vn-type] = $v2-0203#VN
    * coding[vn-type].system 1.. MS
    * coding[vn-type].code 1.. MS
  * system 1..
  * value 1..
* status MS
* status from $EncounterStatusDe (required)
  * ^short = "planned | in-progress | onleave | finished | cancelled +"
  * ^definition = "planned | in-progress | onleave | finished | cancelled +."
  * ^binding.description = "Eingeschränkter Status vgl. FHIR R5"
* class MS
* class from $EncounterClassDE (required)
* type MS
  * ^slicing.discriminator[0].type = #pattern
  * ^slicing.discriminator[0].path = "$this"
  * ^slicing.rules = #open
* type contains
    Kontaktebene ..1 MS and
    KontaktArt ..1 MS
* type[Kontaktebene] from $kontaktebene-de (required)
  * ^patternCodeableConcept.coding[0].system = "http://fhir.de/CodeSystem/Kontaktebene"
  * ^binding.description = "Kontaktebene"
* type[KontaktArt] from $kontaktart-de (required)
* type[KontaktArt] ^patternCodeableConcept.coding[0].system = "http://fhir.de/CodeSystem/kontaktart-de"
* serviceType 1.. MS
  * coding 1.. MS
    * ^slicing.discriminator[0].type = #pattern
    * ^slicing.discriminator[0].path = "$this"
    * ^slicing.rules = #open
  * coding contains Fachabteilungsschluessel ..1 MS
  * coding[Fachabteilungsschluessel] from $Fachabteilungsschluessel (required)
  * coding[Fachabteilungsschluessel] ^patternCoding.system = "http://fhir.de/CodeSystem/dkgev/Fachabteilungsschluessel"
* subject 1.. MS
  * reference 1.. MS
* period 1.. MS
  * start 1.. MS
  * end MS
* diagnosis MS
  * condition MS
    * reference 1..
  * use 1.. MS
    * ^binding.strength = #extensible
  * rank MS
* hospitalization MS
  * admitSource 1.. MS
  * admitSource from $Aufnahmeanlass (preferred)
  * dischargeDisposition MS
    * extension contains $Entlassungsgrund named Entlassungsgrund ..1 MS
* location MS
  * location MS
    * display 1.. MS
* serviceProvider MS
  * display 1.. MS
* partOf MS


// Code is working
Profile: ISiKPatient
Parent: Patient
Id: ISiKPatient
Description: "Dieses Profil beschreibt die Nutzung von administrativen Patientendaten in ISiK-Szenarien."
* insert Meta
* obeys isik-pat-1
* . ^constraint[5].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKPatient"
* id 1.. MS
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    Versichertennummer-GKV 0..1 MS and
    Patientennummer 1..* MS and
    Versichertennummer_PKV 0..1
* identifier[Versichertennummer-GKV] only IdentifierKvid10
  * ^patternIdentifier.type = $identifier-type-de-basis#GKV
  * type 1.. MS
  * system MS
  * value MS
* identifier[Patientennummer] only IdentifierPid
  * ^patternIdentifier.type = $v2-0203#MR
  * type MS
  * system MS
  * value MS
* identifier[Versichertennummer_PKV] only IdentifierPkv
  * ^patternIdentifier.type = $identifier-type-de-basis#PKV
  * ^mustSupport = false
  * use MS
  * type 1.. MS
  * value MS
  * assigner MS
    * identifier.system MS
    * identifier.value MS
    * display MS
* active MS
* name MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to maintain the differntiations of name parts as given in the VSDM dataset or qualify prefixes as academic titles, vendors can opt to support the extensions specified in the German HumanName Base Profile https://simplifier.net/basisprofil-de-r4/humannamedebasis\r\nThis is however not required within the scope of this specification."
* name contains
    Name 1..1 MS and
    Geburtsname 0..1 MS
* name[Name] only HumannameDeBasis
  * ^patternHumanName.use = #official
  * use 1.. MS
  * family 1.. MS
    * extension[namenszusatz] 0..1 MS
    * extension[nachname] 0..1 MS
    * extension[vorsatzwort] 0..1 MS
  * given 1.. MS
  * prefix MS
    * extension[prefix-qualifier] 0..1 MS
    * extension[prefix-qualifier].value[x] = #AC (exactly)
* name[Geburtsname] only HumannameDeBasis
  * ^patternHumanName.use = #maiden
  * use 1.. MS
  * family 1.. MS
    * extension[namenszusatz] 0..1 MS
    * extension[nachname] 0..1 MS
    * extension[vorsatzwort] 0..1 MS
  * given ..0
  * prefix ..0
* telecom.system 1..
* telecom.value 1..
* gender 1.. MS
  * extension contains GenderOtherDE named Geschlecht-Administrativ 0..1 MS
* birthDate 1.. MS
  * extension contains $data-absent-reason named Data-Absent-Reason 0..1 MS
  * extension[Data-Absent-Reason].value[x] = #unknown (exactly)
  * extension[Data-Absent-Reason].value[x] MS
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
// extension is working only with ms or cardinality
  * extension[Stadtteil]
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKPatient"
* address[Strassenanschrift] only AddressDeBasis
// extension working only with ms or cardinality
  * extension[Stadtteil] 
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKPatient"


// Code is working
Profile: ISiKPersonImGesundheitsberuf
Parent: Practitioner
Id: ISiKPersonImGesundheitsberuf
Description: "Dieses Profil ermöglicht die Nutzung von in Gesundheitsberufen tätigen Personen in ISiK Szenarien."
* insert Meta
* obeys prac-de-1
* . ^constraint[5].source = "http://gematik.de/fhir/ISiK/StructureDefinition/Practitioner"
* id MS
* identifier 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    Arztnummer 0..* MS and
    EFN 0..1 MS // and
//    TelematikId 0..1 MS
* identifier[Arztnummer] only IdentifierLanr
  * ^patternIdentifier.type = $v2-0203#LANR
  * type 1..
* identifier[EFN] only IdentifierEfn
  * ^patternIdentifier.type = $v2-0203#DN
  * type 1..
// * identifier[TelematikId] only IdentifierTelematikId
//  * ^patternIdentifier.type = $v2-0203#PRN
//  * type 1..
* name MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* name contains
    Name 1..1 MS and
    Geburtsname 0..1
* name[Name] only HumannameDeBasis
  * ^patternHumanName.use = #official
  * use 1.. MS
  * use = #official (exactly)
  * family 1.. MS
  * given 1.. MS
  * prefix MS
* name[Geburtsname] only HumannameDeBasis
  * ^patternHumanName.use = #maiden
  * use 1.. MS
  * use = #maiden (exactly)
  * family 1..
  * given ..0
  * prefix ..0
* telecom.system 1..
* telecom.value 1..
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * extension[Stadtteil] MS
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* address[Strassenanschrift] only AddressDeBasis
  * extension[Stadtteil] MS
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 MS
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
    * extension[Postfach] 0..0
  * city 1.. MS
  * postalCode 1.. MS
  * country 1.. MS
* gender MS
  * extension contains GenderOtherDE named Geschlecht-Administrativ 0..1 MS
  * extension[Geschlecht-Administrativ].value[x] MS
* birthDate.extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* birthDate.extension contains $data-absent-reason named Data-Absent-Reason 0..1 MS
* qualification.code.coding 1..
* qualification.code.coding from $KBV_VS_Base_Practitioner_Speciality (preferred)


// Code is working
Profile: ISiKProzedur
Parent: Procedure
Id: ISiKProzedur
Description: "Diese Profil ermöglicht die Nutzung von Prozedur-bezogenen Informationen in ISiK Szenarien."
* insert Meta
* obeys proc-ISiK-1 and proc-ISiK-2
* . ^constraint[5].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKProzedur"
* id 1.. MS
* extension MS
* extension ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains ExtensionProzedurDokumentationsdatum named Dokumentationsdatum 0..1 MS
* status MS
* category MS
  * coding ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains SNOMED-CT 0..1 MS
  * coding[SNOMED-CT] from $ProzedurenKategorie-SCT (preferred)
    * system 1.. MS
    * system = "http://snomed.info/sct"
    * code 1.. MS
* code MS
  * obeys sct-ops-1 and proc-ISiK-3
  * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKProzedur"
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "system"
    * ^slicing.rules = #open
  * coding contains
      OPS 0..1 MS and
      SNOMED-CT 0..1
  * coding[OPS] only CodingOPS
  * coding[OPS] from OpsVS (required)
    * extension[Seitenlokalisation] MS
    * system MS
    * version MS
    * code MS
  * coding[SNOMED-CT] from $ProzedurenCodes-SCT (required)
    * system 1.. MS
    * system = "http://snomed.info/sct"
    * code 1.. MS
  * text MS
* subject MS
  * reference 1.. MS
* encounter MS
* performed[x] 1.. MS
* performed[x] only dateTime or Period
* note MS


// Code is working
Profile: ISiKAngehoeriger
Parent: RelatedPerson
Id: ISiKAngehoeriger
Description: "Dieses Profil ermöglicht die Nutzung von Angehörigen in ISiK Szenarien."
* insert Meta
* obeys relatedp-de-1
* patient 1..1 MS
* patient only Reference(ISiKPatient)
  * reference 1..
* name 1..1 MS
* name only HumannameDeBasis
* gender.extension contains GenderOtherDE named Geschlecht-Administrativ 0..*
* gender.extension[Geschlecht-Administrativ] ^mustSupport = false
* address MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
  * ^comment = "In order to differentiate between post box addresses and physical addresses, street names and house numbers, and to add city district names, vendors can opt to support the extensions as suggested in the German Address Base Profile http://fhir.de/StructureDefinition/address-de-basis.\r\nSuch differentiations are however not required within the scope of this specification."
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Postfach] only AddressDeBasis
  * ^patternAddress.type = #postal
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1 
    * extension[Hausnummer] 0..1 
    * extension[Adresszusatz] 0..1 
    * extension[Postfach] 0..1
  * city 1.. MS
  * postalCode 1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKAngehoeriger"
* address[Strassenanschrift] only AddressDeBasis
  * ^patternAddress.type = #both
  * type 1.. MS
  * line 1.. MS
    * extension[Strasse] 0..1
    * extension[Hausnummer] 0..1
    * extension[Adresszusatz] 0..1
    * extension[Postfach] 0..1
  * city 1.. MS
  * postalCode 1.. MS
  * country  1.. MS
    * obeys address-cnt-2or3-char
    * ^constraint[1].source = "http://gematik.de/fhir/ISiK/StructureDefinition/ISiKAngehoeriger"
  