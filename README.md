# Microsegmentation Demo - Deploy a VM with Enforcer

These Terraform templates will deploy a VM on GCP with Enforcer installed and connected to the Prisma Cloud Console.


## Prequisites:
1. Create a new microsegmentation namespace

2. Create a new project in Google Cloud Platform (or use an existing project)

3. Create a cloud auto-registration policy on Prisma Cloud Console
    - Navigate to the namespace where you will deploy the Enforcer
    - Go to Network Security -> Namespaces -> Authorizations
    - click on the "+" sign and create a cloud auto-registration policy
    - Under "Auto-registration":
        - For Cloud Provider, choose GCP
        - For Claims, enter the key=value pairs:
            - projectid=<Google_Project_ID>

4. Terraform v1.0 and above

5. Install gcloud CLI
    - https://cloud.google.com/sdk/docs/install

6. SSH key pair



## Deployment
1. Update the "terraform.tfvars" file with the necessary information.

2. Run "terraform init"

3. Run "terraform apply"

4. VM will be deployed. It takes about 10 minutes for it to be fully ready.
    - Go to Network Security -> Agent -> Enforcers to check that the Enforcer is connected to the Console

5. The public IP of the VM will be shown in the terraform outputs.




## Removing The Demo Environment

1. Run "terraform destroy"
