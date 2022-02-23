### Interaktionen

Für die Ressource Condition MUSS die REST-Interaktion "READ" implementiert werden.

Folgende Suchparameter sind für das Bestätigungsverfahren relevant, auch in Kombination:

1. Der Suchparameter "_id" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?_id=test```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_id" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "clinical-status" MUSS unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?clincial-status=active```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.clinicalStatus" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "patient" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Condition?patient=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.

1. Der Suchparameter "subject" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Condition?subject=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.subject" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "encounter" MUSS unterstützt werden:

   Beispiele:

    ```GET [base]/Condition?encounter=Patient/123```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.encounter" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Reference Search"](https://www.hl7.org/fhir/search.html#reference).

1. Der Suchparameter "recorded-date" MUSS unterstützt werden:

    Beispiele

    ```GET [base]/Condition?recorded-date=2015-01-01T12:00:23Z+02:00```

    Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.recordedDate" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Date Search"](http://hl7.org/fhir/R4/search.html#date).

1. Der Suchparameter "related" MUSS unterstützt werden:

   Beispiele

   ```GET [base]/Condition?related=Condition/123```

   Anwendungshinweise: Weitere Informationen zur Suche nach "Condition.related" finden sich im [Leitfaden Basis DE (R4) - Abschnitt "Diagnosen (Condition) - Doppel-/Mehrfachkodierte ICD-Codes"](https://simplifier.net/guide/basisprofil-de-r4/Ressourcen-DiagnosenCondition).

1. Der Suchparameter "_profile" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?_profile=https://gematik.de/fhir/ISiK/StructureDefinition/ISiKDiagnose```

    Anwendungshinweise: Weitere Informationen zur Suche nach "_profile" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Parameters for all resources"](http://hl7.org/fhir/R4/search.html#all).

1. Der Suchparameter "category" KANN unterstützt werden:

    Beispiele:

    ```GET [base]/Condition?category=http://hl7.org/fhir/ValueSet/condition-category|problem-list-item```

    Anwendungshinweise: Weitere Informationen zur Suche nach "category" finden sich in der [FHIR-Basisspezifikation - Abschnitt "Token Search"](http://hl7.org/fhir/R4/search.html#token).

    Dieser Suchparameter ist für die Umsetzung des IHE QEDm Profils verpflichtend.
