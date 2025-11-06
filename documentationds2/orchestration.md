# Orchestration

| Project Links |                                
| ----------------------------------------------- |
| Software GitHub Repository <https://github.com/ds2-eu/orchestration> |
| Progress GitHub Project <https://github.com/orgs/ds2-eu/projects/9> |

## General Description

To design and then orchestrate at runtime In-Dataspace, Inter-Dataspace, internal, and third-party services which facilitate common data-orientated operations such as transformation of data, checks on data, data updates etc. The orchestrator contains a flexible GUI to design workflows and decision points on these services, and runtime component to implement the workflow.

Services are added to and then selected from a Service catalog from a participant’s local service catalog (In-Dataspace deployment), the DS2 service intermediary catalog (Inner-Dataspace), or other available catalog/service knowledge. These services can be graphically linked together to form a workflow and where decision pathways, decision points, and other operators can be deployed to determine the workflow. Error and exit points should be predetermined with defaults ensuring that failures and error conditions allow flows to be closed automatically. One class of operator is for user defined forms for human input but most often the flows contain backend services. In the context of DS2 the operators will, if necessary, be expanded based on novel usecase peculiarities as will the forms designer. Primarily the design interface is orientated around service interconnectivity, but this will be augmented with a data pre-viewer to help interconnect and understand the results of interconnecting data-orientated services. The orchestrator will be available as a module and for interparticipant service orchestration will extend the connectors. 

## Component Definition

The figure below represents the actors, internal structure, primary sub-components, primary DS2 module interfaces, and primary other interfaces of the module.
![DS2 ORC Architecture](./images/WP04-ORC-ds2architecture.png)

This module has the following subcomponent and other functions:

### Orchestration Module - Core
* **Orchestration Core**: This is the runtime heart of orchestration which conducts a process (workflow) triggering other services and via a BPMN module from the Service Composition designer repository. For the tier 1 standard connections (Portal etc) it can be perceived as the entry point. If new orchestration design methods are needed, it will use them. Runtime events are connected to the logging components and for inter-participant dataflows it will interface with the DS2 Cross Participant Orchestration subcomponent. This is currently ICE background and will see little development except for a DS2 compliant UI.

* **DS2 Service Registry**:
    * **In-participant**: This is a local registry of all services which a participant may potentially use in a workflow, composed together in the designer, 
        and executed in the runtime. Registration can be automatic in the case of IDT installed services. 
        It will also expose services in the inter-participant DS2 registry. The submodule exists now but will be rebuilt in the context of DS2 and IDT. 
    * **Between Participant**: 95% the same functionality but can function similarly to a metadata broker to host services from multiple participants 
        which can be shared in a controlled way to the In-participant registry to allow participant-participant service interactions 

* **Service Composition Designer (DS2 Upgrade)**: This is the main UI for the Orchestration Designer based on existing ICE background. It allows a user to select or drag various elements from a toolbox (services/APIs from the DS2 Service Registry, methods), which can be placed on a canvas where they can then begin to start designing their orchestration by dragging and connecting various elements together. The saved BPMN2.0 notation model will then be used by the runtime orchestration core. The DS2 upgrade will be mainly for UI and inclusion of New Data Previewer and Forms designer blocks. 

* **Forms designer**: Many orchestrations have a need for user input and whilst some might come from other systems this can be complex when only limited information. The forms designer will allow the easy inclusion of simple form in any Service composition and also ensure that it respect the data flow as well as service needs.

* **Data Previewer**: This is also a new subcomponent which will be rendered via the Service composition designer. Currently services are connected but when designing it is useful to know at design time what might be the inputs and the expect result. In a data orientated project this is especially useful, and this utility will allow some rendering of data to help show flow operations between building blocks before they are deployed. 

* **New Orchestration methods (from pilots)**: Many methods – eg choice boxes, selections are already implemented in the orchestrator, but it is possible that the pilot might suggest further ones that could be interesting to implement – although at this stage of the analysis it seems there is not. The new methods will be exposed in the orchestrator runtime & designer. 

* **Orchestration track/log**: Currently this is rudimentary and especially in the trustworthy context of dataspace an major overhaul is necessary to extract more granular logging information at runtime.  

* **Services and API**: These are the services that can be orchestrated, and the API block is the interface to: 
    * Other External (non DS2) Modules/Services
    * DS Service Intermediaries
    * Tier 2 In dataspace DS Modules/Service:

* **Tier 0 Support Service Stack**:
    * **DRM and API**: For further exploration, but if room to implement and a match of requirements to feature the blockchain part of the DRM module 
    to enhance logging 
    * **DARC & API**: As with DRM but in this case to use DARC to help configuration of the module 
    * **Culture and Language Module and API

* **Tier 1 Service Stack for Marketplace and deployment and API**: The full stack will be implemented as generically described elsewhere in this document. Exceptions: The Platform will only be needed for inter-participant service orchestrations if used

### Inter-Participant orientated

* **DS2 Cross Participant Orchestration**: This is a new runtime module which will act as a bridge between the orchestration within each participant through interconnections to the Inter-Participant Service Registry and the Orchestration core at each participant 

* **DS2 Service Registry**: As described above 

* **Tier 3 Trust Stack and API**: For interparticipant service the module will use relevant parts of the DS2 trust stack

## Screenshots

Display a gif with several representative screenshots of the module

## Commercial Information

Table with some admin information : authors, company, ipr, etc.

| Organisation (s) | License Nature | Licenses |
| | | |
| i4RI | Open Source | Apache 2.0 |

## Top Features

Table with most representative features from the roles, resourcing and milestones table in the module architecture

## How To Install

Steps to install the module, first standalone for testing and then with the idt

## How To Use

Steps on how to use the different features of the module

## Additional Links

