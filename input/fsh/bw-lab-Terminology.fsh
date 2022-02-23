Alias: TS = http://hl7.org/fhir/ValueSet/task-status
Alias: TI = http://hl7.org/fhir/ValueSet/task-intent
Alias: DS = http://hl7.org/fhir/diagnostic-report-status
Alias: LOINC = http://loinc.org

ValueSet:   BwLabTaskStatusVS
Id: bw-lab-task-status-vs
Title: "Botswana Status for Lab Task"
Description:  "The status of the task, subset from https://www.hl7.org/FHIR/valueset-task-status.html"
* TS#task-status-requested "Requested"
* TS#task-status-rejected "Rejected"
* TS#task-status-accepted "Accepted"
* TS#task-status-completed "Completed"

ValueSet:   BwLabTaskIntentVS
Id: bw-lab-task-intent-vs
Title: "Botswana Intent for Lab Task"
Description:  "The intent of the task, subset from https://www.hl7.org/FHIR/valueset-task-intent.html"
* TI#task-intent-order "Order"

ValueSet: BwLabOrderCodeVS
Id: bw-lab-order-code-vs
Title: "Botswana Lab Order Code"
Description: "The code for the lab order."
* include codes from system LOINC

ValueSet: BwLabDiagnosticReportStatusVS
Id: bw-lab-diagnostic-report-status-vs
Title: "Botswana Diagnostic Report Status Flag"
Description:  "The status of the diagnostic report, subset from https://www.hl7.org/fhir/valueset-diagnostic-report-status.html"
* DS#diagnostic-report-status-partial "Partial"
* DS#diagnostic-report-status-final "Final"
* DS#diagnostic-report-status-unknown "Unknown"
* DS#diagnostic-report-status-canceled "Canceled"
* DS#diagnostic-report-status-amended "Amended"



/*
tblkLabOrderStatus	
LabOrderStatusID	LabOrderStatus
1	Ordered
2	Fully drawn
3	Partially resulted
4	Fully resulted
5	Cancelled
6	Partially drawn
*/

CodeSystem: BwPimsLabOrderStatusCS
Id: bw-pims-lab-order-status-cs
Title: "PIMS Lab Order Status Code System"
Description: "PIMS Lab Order Status Code System"
* insert PublisherContextDefinitional
* #ordered
    "Ordered"
    "Order was requested"
* #fully-drawn
    "Fully-drawn"
    "All Order specimens were drawn"
* #partially-resulted
    "Partially-resulted"
    "Partial results are available"
* #cancelled
    "Cancelled"
    "Order was cancelled" 
* #partially-drawn
    "Partially-drawn"
    "Some order specimens were drawn"

ValueSet: BwPimsLabOrderStatusVS
Id: bw-pims-lab-order-status-vs
Title: "Status Values for PIMS Lab Orders"
Description: ""
* include codes from system BwPimsLabOrderStatusCS

/**
* tblkLabClass				
    LabClassID	LabClass	LabClassCode	SpecimenSequence	SortOrder
    1	Routine Chemistry	CHM	1	1
    2	Microbiology	MCB	0	2
    3	Haematology	HEM	2	3
    5	Pathology	PTH	0	5
    6	Imaging	IMG	1	6
    7	Endocrinology	END	1	7
    9	Immunology	IMU	7	9
    12	Blood Bank	BBK	2	12
    14	Immunology Viral Load	VL	4	10
    15	Research blood draw	RS	0	13
    16	TB diagnostic	TB	0	14 
*/

CodeSystem: BwPimsLabClassCS
Id: bw-pims-lab-class-cs
Title: "PIMS Lab Class Code System"
Description: "PIMS Lab Class Code System"
* insert PublisherContextDefinitional
* #CHM
    "Routine-Chemistry"
    ""
* #MCB
    "Microbiology"
    "All Order specimens were drawn"
* #HEM
    "Haematology"
    "Partial results are available"
* #PTH
    "Pathology"
    "Order was cancelled" 
* #IMG
    "Imaging"
    "Some order specimens were drawn"
* #END
     "Endocrinology"
    "Some order specimens were drawn"
* #IMU
    "Immunology"
    "Some order specimens were drawn"
* #BBK
    "Blood-Bank"
    "Order was cancelled" 
* #VL
    "Immunology-Viral-Load"
    "Some order specimens were drawn"
* #RS
     "Research-blood-draw"
    "Some order specimens were drawn"
* #TB
    "TB-diagnostic"
    "Some order specimens were drawn"

ValueSet: BwPimsLabClassVS
Id: bw-pims-lab-class-vs
Title: "Status Values for PIMS Lab Orders"
Description: ""
* include codes from system BwPimsLabClassCS

/**
* tblkLabTest								
LabTestID	LabTest	LabResultClassID	Active	LabTestGenderID	LabTestAgeCategoryID	BasicTest	ListOrder	Mnemonic
1	CD4 count	1	1	3	5	1	1	CD4
2	CD4%	1	1	3	5	1	2	CD4%
3	Viral load	1	1	3	5	1	3	VL
4	Packed cell volume (PCV)	1	1	3	5	0	21	NULL
5	White blood cells (WBC)	1	1	3	5	1	10	WBC
7	Neutrophils %	1	1	3	5	0	12	NULL
9	Aspartate aminotransferase (AST)	1	1	3	5	1	9	AST
10	Gamma glutamyl transferase (GGT)	1	1	3	5	0	NULL	NULL
11	Alkaline phosphatase (ALP)	1	1	3	5	0	NULL	ALP
12	Lipase	1	1	3	5	0	NULL	LIP
13	TGS	1	1	3	5	1	12	TGS
14	Urea	1	1	3	5	1	13	Urea
15	Sodium	1	1	3	5	1	14	Na
16	Potassium	1	1	3	5	1	15	K
17	DNA PCR	4	1	3	5	0	NULL	PCR
18	Ag	1	1	3	5	0	NULL	NULL
19	Culture sensitive test	1	1	3	5	0	NULL	NULL
20	Mean cell volume(MCV)	1	1	3	5	0	3	MCV
21	Rapid	4	1	3	5	0	NULL	NULL
22	ELISA	4	1	3	5	0	NULL	NULL
23	Urine pregnancy	4	1	1	3	0	NULL	NULL
25	Chest X-Ray	10	1	3	5	0	NULL	NULL
26	Pleural tap	3	1	3	5	0	NULL	NULL
27	CSF	3	1	3	5	0	NULL	NULL
28	Lymph node biopsy	3	1	3	5	0	NULL	NULL
29	Pap smear	5	1	1	3	0	NULL	NULL
30	Creatinine	1	1	3	5	1	4	Creat
31	Uric acid	1	1	3	5	0	NULL	NULL
32	Chloride	1	1	3	5	0	NULL	NULL
33	Alanine aminotransferase (ALT)	1	1	3	5	1	10	ALT
34	Total protein	1	1	3	5	0	NULL	NULL
35	Albumin	1	1	3	5	0	NULL	NULL
36	Total bilirubin	1	1	3	5	0	NULL	NULL
37	Direct bilirubin	1	1	3	5	0	NULL	NULL
38	Amylase	1	1	3	5	0	NULL	NULL
39	Creatine kinase (CK)	1	1	3	5	0	NULL	NULL
40	CKMB	1	1	3	5	0	NULL	NULL
41	Lactate dehydrogenase (LDH)	1	1	3	5	0	NULL	LDH
42	Cholesterol	1	1	3	5	0	NULL	NULL
43	Triglycerides	1	1	3	5	0	NULL	NULL
44	Calcium	1	1	3	5	0	NULL	NULL
45	Phosphate	1	1	3	5	0	NULL	NULL
46	Magnesium	1	1	3	5	0	NULL	NULL
47	Lactate	1	1	3	5	0	NULL	NULL
48	Glucose	1	1	3	5	0	NULL	NULL
49	Carbon dioxide (CO2)	1	1	3	5	0	NULL	NULL
50	HBA1C	1	1	3	5	0	NULL	NULL
51	High density lipoprotein (HDL)	1	1	3	5	0	NULL	NULL
52	Low density lipoprotein (LDL)	1	1	3	5	0	NULL	NULL
53	CSF glucose	1	1	3	5	0	NULL	NULL
54	CSF protein	1	1	3	5	0	NULL	NULL
55	a-HBDH	1	1	3	5	0	NULL	NULL
56	Myoglobin	1	1	3	5	0	NULL	NULL
57	Triponin I	1	1	3	5	0	NULL	NULL
58	Insulin	1	1	3	5	0	NULL	NULL
59	Red blood cell count (RBC)	1	1	3	5	0	1	NULL
60	Haemoglobin (Hb)	1	1	3	5	1	2	Hb
61	ABO group	9	1	3	5	0	NULL	NULL
62	Crossmatch	14	1	3	5	0	NULL	NULL
63	Indirect COOMBS	4	1	3	5	0	NULL	NULL
64	Direct COOMBS	4	1	3	5	0	NULL	NULL
65	Antibody screening	4	1	3	5	0	NULL	NULL
66	Antibody identification	10	1	3	5	0	NULL	NULL
67	Antibody titration	1	1	3	5	0	NULL	NULL
68	RH group	4	1	3	5	0	NULL	NULL
69	Mean corpuscular haemoglobin (MCH)	1	1	3	5	0	4	NULL
70	Mean corpuscular haemoglobin conc. (MCHC)	1	1	3	5	0	5	NULL
71	RDW-CV	1	1	3	5	0	8	NULL
72	RDW-SD	1	1	3	5	0	7	NULL
73	Lymphocytes %	1	1	3	5	0	14	NULL
74	Monocytes %	1	1	3	5	0	16	NULL
76	Basophils %	1	1	3	5	0	20	NULL
77	Neutrophils count	1	1	3	5	1	11	Neutro
78	Lymphocytes count	1	1	3	5	0	13	NULL
79	Monocytes count	1	1	3	5	0	15	NULL
80	Eosinophils count	1	1	3	5	0	17	NULL
81	Basophils count	1	1	3	5	0	19	NULL
82	Platelets (PLT)	1	1	3	5	1	6	PLT
83	Reticulocytes	1	1	3	5	0	NULL	NULL
84	Prothrombin time	1	1	3	5	0	NULL	NULL
85	Activated partial time	1	1	3	5	0	NULL	NULL
86	Bleeding time	1	1	3	5	0	NULL	NULL
87	Erythrocyte sedim rate	1	1	3	5	0	NULL	NULL
88	Eosinophils %	1	1	3	5	0	18	NULL
89	Mean plate volume (MPV)	1	1	3	5	0	9	MCV
90	Syphilis	16	1	3	5	0	NULL	NULL
91	Antistreptolysin O test (ASO)	4	1	3	5	0	NULL	NULL
92	Rheumatoid factors test (RF)	4	1	3	5	0	NULL	NULL
93	CRP	4	1	3	5	0	NULL	NULL
94	TPHA	4	1	3	5	0	NULL	NULL
95	CRAG	4	1	3	5	0	NULL	NULL
96	Monospot	4	0	3	5	0	NULL	NULL
97	Macroscopy	15	1	3	5	0	NULL	NULL
98	Cell count	15	1	3	5	0	NULL	NULL
99	Gram stain	15	1	3	5	0	NULL	NULL
100	Differential count	15	1	3	5	0	NULL	NULL
101	Culture and organism identification	15	1	3	5	0	NULL	NULL
102	Susceptibility testing	15	1	3	5	0	NULL	NULL
103	India ink	4	1	3	5	0	NULL	NULL
104	Urine chemistry/urinalysis	15	1	3	5	0	NULL	NULL
105	Microscopy	15	1	3	5	0	NULL	NULL
106	Wet preparation	15	1	3	5	0	NULL	NULL
107	Wet preparation for ova, cysts and parasites	15	1	3	5	0	NULL	NULL
108	Modified Zeil-Nelson stain	19	1	3	5	0	NULL	NULL
109	Clostridium difficile toxin A test	4	1	3	5	0	NULL	NULL
110	Rotavirus test (babies)	4	1	3	5	0	NULL	NULL
111	Stool occult blood test	4	1	3	5	0	NULL	NULL
112	Obstetric ultrasound	10	1	1	3	0	NULL	NULL
113	Pelvis ultrasound	10	1	3	5	0	NULL	NULL
116	Gynaecological cytology (pap smear)	15	1	1	3	0	NULL	NULL
117	Non-gynaecological cytology (body fluids)	15	1	3	5	0	NULL	NULL
118	Routine histology	10	1	3	5	0	NULL	NULL
119	Special stains	10	1	3	5	0	NULL	NULL
120	Immunohistochemistry (referral)	10	1	3	5	0	NULL	NULL
122	VDRL RPR	22	1	1	3	1	3	VD
123	Western blot	4	NULL	3	5	NULL	NULL	NULL
125	Unspecified	4	1	3	5	0	NULL	NULL
126	VIA	23	1	1	3	0	NULL	NULL
127	Research	24	1	3	5	0	NULL	NULL
128	Sputum AAFB	25	1	3	5	NULL	NULL	AAFB
129	Xpert	26	1	3	5	0	NULL	Xpert
130	Sputum microscopy	15	1	3	5	0	NULL	microscopy
*/

CodeSystem: BwPimsLabTestCS
Id: bw-pims-lab-test-cs
Title: "PIMS Lab Test Code System"
Description: "PIMS Lab Test Code System"
* insert PublisherContextDefinitional
* #CD4
    "CD4 Count"
    "tblkLabTest#1 - CD4 count"
* #CD4%
    "CD4 Percentage"
    "tblkLabTest#2 - CD4 Percent"
* #VL
    "Viral Load"
    "tblkLabTest#3 - Viral Load (HIV?)"
* #PCV
    "Packed Cell Volume (PCV)"
    "tblkLabTest#4 - Packed Cell Volume"
* #WBC
    "White Blood Cells(WBC)"
    "tblkLabTest#5 - White Blood Cells"
* #NP%
    "Neutrophils %"
    "tblkLabTest#7 - Neutrophils %"
* #AST
    "Aspartate Aminotrasferase"
    "tblkLabTest#9 - Aspartate aminotrasferase"
* #GGT
    "Gamma Glutamyl Transferase"
    "tblkLabTest#10 - Gamma glutamyl transferase"
* #ALPL
    "Alkaline Phosphatase"
    "tblkLabTest#11 - Alkaline Phosphatase"
* #LIP
    "Lipase"
    "tblkLabTest#12 - Lipase"
* #TGS
    "TGS"
    "tblkLabTest#13 - TGS"
* #Urea
    "Urea"
    "tblkLabTest#14 - Urea"
* #Na
    "Sodium"
    "tblkLabTest#15 - Sodium"
* #K
    "Potassium"
    "tblkLabTest#16 - Potassium"
* #PCR
    "DNA PCR"
    "tblkLabTest#17 - DNA PCR"
* #Ag
    "Ag"
    "tblkLabTest#18 - DNA PCR"
* #CST
    "Culture Sensitive Test"
    "tblkLabTest#19 - Culture Sensitive Test"
* #MCV
    "Mean Cell Volume"
    "tblkLabTest#20 - Mean cell volume"
* #Rapid
    "Rapid"
    "tblkLabTest#21 - Rapid"
* #ELISA
    "ELISA"
    "tblkLabTest#22 - ELISA"
* #UP
    "Urine Pregnancy"
    "tblkLabTest#23 - Urine pregnancy test"
* #CXRAY
    "Chest X-Ray"
    "tblkLabTest#25 - Chest x-ray"
* #PT
    "Pleural Tap"
    "tblkLabTest#26 - Pleural tap"
* #CSF
    "CSF"
    "tblkLabTest#27 - CSF"
* #LNB
    "Lymph Node Biopsy"
    "tblkLabTest#28 - Lymph node biopsy"
* #SM
    "Sputum Microscopy"
    "tblkLabTest#130 - Sputum microscopy"

ValueSet: BwPimsLabTestVS
Id: bw-pims-lab-test-vs
Title: "PIMS Lab Test Codes"
Description: "PIMS Lab Test Codes"
* include codes from system BwPimsLabTestCS