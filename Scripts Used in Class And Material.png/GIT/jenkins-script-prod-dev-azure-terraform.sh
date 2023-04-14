https://julie.io/writing/terraform-on-azure-pipelines-best-practices/

#!/bin/bash
git clone -b ${GIT_BRANCH} git@github.com:SreeVeerDevOps/DevOpsB19-GIT-Azure-Terraform.git DevOpsB19-GIT-Azure-Terraform-${GIT_BRANCH}
cd DevOpsB19-GIT-Azure-Terraform-${GIT_BRANCH}
echo "-------------------------"
ls -al
echo "-------------------------"
terraform init 
echo "-------------------------"
terraform validate || exit 1
echo "-------------------------"
terraform plan
echo "-------------------------"
terraform apply --auto-approve
echo "-------------------------"
terraform state list
echo "-------------------------"
#terraform destroy --auto-approve
#echo "-------------------------"
cd .. && rm -rf cd DevOpsB19-GIT-Azure-Terraform-${GIT_BRANCH}