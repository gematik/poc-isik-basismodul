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