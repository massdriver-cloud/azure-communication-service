## Azure Communication Services

Azure Communication Services provides rich communication experiences with voice, video, chat, and SMS across your applications. It is designed for global scale, high availability, and seamless integration with Azure's broader ecosystem.

### Design Decisions

- **Data Location Mapping:** The module includes a mapping configuration to enable deployments in reliable and compliant Azure regions based on the specified geography.
- **Resource Group Management:** Resource groups are created dynamically based on provided metadata to ensure that resources are organized and can be managed efficiently.
- **Security Roles:** By default, a Contributor role is assigned to manage Azure Communication Services efficiently, ensuring necessary permissions are set up.
- **Integration with Massdriver:** The module outputs integration points in JSON format for easy use with Massdriver for further orchestration and lifecycle management.

### Runbook

#### Service Unavailable or Cannot Create Resource

You might encounter scenarios where the service is unavailable or you cannot create the resource.

**Azure CLI: Check Resource Group**

Ensures that the resource group exists and is in the correct location.

```sh
az group show --name <resource_group_name>
```
Replace `<resource_group_name>` with your actual resource group name. You should see the details of the resource group if it exists.

**Azure CLI: Check Communication Service Status**

Verifies that the Azure Communication Service instance is correctly set up and running.

```sh
az communication service show --name <communication_service_name> --resource-group <resource_group_name>
```
Replace `<communication_service_name>` and `<resource_group_name>` with your actual service and resource group names. If the service is running, you will see the details returned.

#### Authentication Issues

Authentication issues may prevent the service from functioning correctly.

**Azure CLI: Validate Service Principal Credentials**

Ensures that the service principal credentials used for deployment are valid.

```sh
az ad sp show --id "<client_id>"
```
Replace `<client_id>` with your service principal client ID. If the credentials are valid, you will see details of the service principal.

#### Connectivity Issues

Ensures that the service endpoint is reachable and not blocked by network policies.

**Azure CLI: Test Endpoint Connectivity**

Runs a connectivity test to ensure that the Azure Communication Service endpoint is reachable.

```sh
curl -v https://<communication_service_name>.communication.azure.com
```
Replace `<communication_service_name>` with your actual service name. This command should return a response from the Azure server if the endpoint is reachable.

#### Role and Permissions Issues

Incorrect roles or permissions can hinder service operations.

**Azure CLI: Verify Role Assignments**

Check if the appropriate roles are assigned to the service principal or user.

```sh
az role assignment list --assignee <principal_id> --scope <resource_id>
```
Replace `<principal_id>` with your service principal ID or user ID and `<resource_id>` with the resource ID of your Azure Communication Service. You should see the assigned roles and ensure they include the necessary permissions like Contributor.

By following these steps, you should be able to manage and troubleshoot your Azure Communication Services effectively.

