# DS2 Quick Start Guide
This section provides the summary of steps needed to install and use the IDT and core modules, from the use cases point of view.

In this version, there are some steps that are manual that will be performed automatically by some of the DS2 Intermediary modules at a later stage.

For the example, we use the demoorg organisation, use cases just need to replace their organisation.

## Register Organisation

1. The first step is to register the organisation in the Portal at <https://portal.ds2.icelab.cloud/> using the name of the oganisation demoorg. Follow the [Portal](modules/Portal.md) for more details on how to use it.

2. Once registered, the Portal will create a GitHub repository for the organisation. This step is so far manual, so create a new GitHub repository with the same name of the organisation at the ds2-eu GitHub. 

    In addition, create a GitHub personal access token (classic) for the user you used to create the organisation repository and grant read, write acces to the repository and read packages. Follow GitHub documentation <https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens>.

## Register Dataspace
At some point you either need to register a Dataspace or link the organisation to a Dataspace. This will be detailed in a late stage where the DS2 Connector is integrated with the DS2 IDM.

## Install IDT

1. Follow installation instructions at [IDT](modules/idt.md) documentation. An example on how to install IDT for demoorg:

```
./minids23.1.sh
```
> With example minids2.yaml file configured as
> ```
> nodeip: 192.168.50.5
> iface: enp0s8
> idt_domain: ds2.demoorg.com
> ```
> In this example, the IDT is installed on a virtual machine with internal ip 192.168.50.5 and the network interface for that ip is enp0s8.
> 
> The domain used for the IDT installation is ds2.demoorg.com, which means, later all modules will have a URL like modulename.ds2.demoorg.com.
> 
> The rancher domain is not set via  which means it will take the internal ip to build its URL rancher.192-168-50-5.sslip.io.
> 
> The ssl_certificate parameter is not set in the file which defaults to 0 which means a self-signed certificate is created.

2. Once the IDT is installed the next step is to install the Containerisation module. This step will be automatic at a later stage.
Follow installation instructions at [Containerisation](modules/containerisation.md) documentation. An example on how to install CONT for demoorg.

First create the platform configuration
```
./kubernetes_configuration.sh ds2-eu/ds2charts <user> <token> ds2.demoorg.com icekube
```
> Replace user with the GitHub user used that created the organisation repository
> 
> Replace token with the GitHub personal access token for the user
>
> Replace ds2.demoorg.com with your domain for the modules
>
> icekube is static so far

Then install the controllers
```
./installfluxghorg.sh <token> ds2-eu demoorg
```
> Replace token with the GitHub personal access token for the user
>
> ds2-eu is static so far
>
> Replace demoorg with the name the created repository ie. the name of the organisation

3. Run the copy of core charts and releases from the containerisation repository to the organisation repository
```bash
copy_charts.sh ds2-eu demoorg
```
> ds2-eu is static so far
>
> Replace demoorg with the name the created repository ie. the name of the organisation

Copy the deployment/charts/ folder from the Containerisation repository to the demoorg repository at the root /charts/ folder. 
If the folder does not exist in the demoorg repository, you can create it. 
Copy the ds2/ folder from the Containerisation repository to the demoorg repository at /clusters/my-cluster/.
Copy the releases/ folder from the Containerisation repository to the demoorg repository at /clusters/my-cluster.

This copy step will automatically install the Containerisation UI and backend to install other modules. This will also install the DS2 Connector at a later stage.

## Deploy a module using Containerisation UI

1. To deploy the demomodule example using Containerisation UI ... 
