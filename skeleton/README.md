# ${{ values.name | dump }}

- [Overview](#overview)
- [Customise template](#customise-template)
- [Usage](#usage)

## Overview
Use this template to automatically manage an ArgoCD Workload for a Data Product. If the workload does not exist will be created, otherwise it will be updated.

### What's a Workload?
Workload refers to any data processing step (ETL, job, transformation etc.) that is applied to data in a Data Product. Workloads can pull data from sources external to the Data Mesh or from an Output Port of a different Data Product or from Storage Areas inside the same Data Product, and persist it for further processing or serving.

## Customise template
To customise this template, modify the `spec.mesh.specific` section inside [catalog-info.yaml](./catalog-info.yaml).
**It is not recommended** to edit the fields above `spec.mesh section`, as inconsistencies may be generated.
The best solution is to edit it using the wizard.
In case of doubt, please contact the platform team.

### Customisable fields in `spec.mesh.specific` section:
- **name**: (string) the ArgoCD application name. Must consist of lower case alphanumeric characters, '-' or '.', and must start and end with an alphanumeric character.
- **project**: (string) the ArgoCD project name linked to the application. Must consist of lower case alphanumeric characters, '-' or '.', and must start and end with an alphanumeric character.
- **destination.namespace**: (string) target namespace in which to deploy the manifests from source
- **destination.server**: (string) destination cluster URL
- **source.path**: (string) local path inside the component folder where the manifest are located
- **source.repoURL**:  (string) URL of the repository
- **source.targetRevision**: (string) revision (tag/branch/commit) of the repository (eg HEAD)
- **syncPolicy.automated**: (null | object)  if null, the application synchronization has to be triggered manually (either via ArgoCD or by deploying the component).
  If it is an object, the following sub-fields are available:
    - **prune**: (boolean) specifies whether resources should be pruned during auto-syncing. Default is false.
    - **selfHeal**: (boolean) specifies whether partial app synchronization should be executed when resources are changed only in the target Kubernetes cluster, without any corresponding git changes. Default is false.

## Usage
To get information about this component and how to use it, refer to this [document](./docs/index.md).



