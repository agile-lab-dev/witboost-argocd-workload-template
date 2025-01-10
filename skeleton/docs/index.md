{% set dataProductMajorVersion = values.identifier.split(".")[2] %}
{% set appName = values.name | lower %}
{% set project = values.domainName | replace(" ", ".") | lower ~ "-" ~ values.dataproductName | replace(" ", ".") | lower ~ "-v" ~ dataProductMajorVersion %}



## Component Basic Information

| Field Name              | Example Value                  |
|:------------------------|:-------------------------------|
| **Name**                | ${{ values.name }}             |
| **Description**         | ${{ values.description }}      |
| **Domain**              | ${{ values.domain }}           |
| **Data Product**        | ${{ values.dataproduct }}      |
| **_Identifier_**        | ${{ values.identifier }}       |
| **_Development Group_** | ${{ values.developmentGroup }} |
| **Depends On**          | ${{ values.dependsOn }}        |


## Application Details


| **Field Name**             | **Value**                                                                                                         |
|----------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Name**                   | ${{ appName }}                                                                                                    |
| **Project**                | ${{ project }}                                                                                                    |
| **Destination Namespace**  | ${{ values.namespace }}                                                                                           |
| **Destination Server**     | ${{ values.server }}                                                                                              |
| **Source Path**            | ${{ values.path  }}                                                                                               |
| **Source Repo URL**        | ${{ values.destination   }}                                                                                       |
| **Source Target Revision** | ${{ values.targetRevision   }}                                                                                    |
| **Automated Sync**         | {% if values.automated %}Prune: ${{ values.prune }}; Self Heal: ${{ values.selfHeal }} {% else %}null {% endif %} |



