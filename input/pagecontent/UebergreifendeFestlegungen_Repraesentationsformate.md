## Repräsentationsformate

Der FHIR-Standard beschreibt drei verschiedene [Repräsentationsformate](http://hl7.org/fhir/formats.html#wire): XML, JSON und RDF (Turtle).
Im Rahmen der ISiK-Spezifikation MÜSSEN bestätigungsrelevante Systeme (Server) die Formate [XML](http://hl7.org/fhir/xml.html) und [JSON](http://hl7.org/fhir/json.html) unterstützen.

Client-seitige Implementierungen haben die Wahl zwischen XML- und JSON-Repräsentation, müssen jedoch in den HTTP Accept- und Content-Type-Headern entsprechend ausweisen, welche Repräsentation gewählt wurde.

Wenn ein Client im Accept-Header ein vom Server nicht unterstütztes Format anfordert, so MUSS der Server mit dem Fehlercode `406 not acceptable` antworten.
Wenn ein Client im Content-Type-Header ein vom Server nicht unterstütztes Format sendet, so MUSS der Server mit dem Fehlercode `415 unsupported media type` antworten.

Es ist zu beachten, dass die Header `Content-Type` und `Accept` noch weitere FHIR-spezifische und allgemeine Parameter enthalten können. Siehe beispielsweise https://www.hl7.org/fhir/http.html#version-parameter. Das Vorhandensein dieser Parameter darf nicht zu einem Fehler führen.

Anfragen, in denen eine andere FHIR-Version als die hier vereinbarte Version `4.0` angefordert wird, müssen mit Fehlercode `406 - not acceptable` beantwortet werden.




