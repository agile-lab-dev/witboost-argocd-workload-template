import "strings"

#ComponentVersion: 	string & =~"^([0-9]+\\.[0-9]+\\..+)$"
#Id:               	string & =~"^[a-zA-Z0-9:._\\-]+$"
#ComponentId:      	#Id & =~"^urn:dmb:cmp:[a-zA-Z0-9:._\\-]+:[a-zA-Z0-9_\\-]+:[a-zA-Z0-9:._\\-]+:[a-zA-Z0-9_\\-]+$"

#OM_Tag: {
	tagFQN:       string & =~"^[a-zA-Z0-9 +=._:/@-]+$"
	description?: string | null
	source:       string & =~"(?i)^(Tag|Glossary)$"
	labelType:    string & =~"(?i)^(Manual|Propagated|Automated|Derived)$"
	state:        string & =~"(?i)^(Suggested|Confirmed)$"
	href?:        string | null
}

#Destination:{
namespace?: null | string
server!: string
}

#Source:{
path!: string
repoURL!: string
targetRevision!: string
}


#AutomatedSync:{
	prune!: bool
	selfHeal!: bool
}

#ArgoCDSpecific:{
	name!: string & =~"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"
	project!: string & =~"^[a-z0-9][a-z0-9.-]*[a-z0-9]$"
	destination!: #Destination
	source!: #Source
	syncPolicy:
		automated: null | #AutomatedSync
...
}

id:                       	#ComponentId
name:                     	string
fullyQualifiedName?:      	null | string
description:              	string
kind:                     	string & =~"(?i)^(workload)$"
version:                  	#ComponentVersion
infrastructureTemplateId: 	string
useCaseTemplateId?:       	null | string
dependsOn?: 					[...#ComponentId]
platform:        			string & =~"(?i)^(ArgoCD)$"
technology:      			string & =~"(?i)^(ArgoCD)$"
workloadType:					string & =~"(?i)^(batch)$"
connectionType:    		string & =~"(?i)^(DataPipeline)$"
tags: 								[...#OM_Tag]
readsFrom?: 					[...#ComponentId]
specific: 						#ArgoCDSpecific
...