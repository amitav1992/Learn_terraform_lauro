Terraform helper usage

This folder includes a helper script, tf.sh, that exports temporary AWS credentials
from your AWS CLI profile and then runs Terraform.

Prerequisites
- AWS CLI installed and logged in
- Terraform installed

Commands
- Initialize: ./tf.sh init
- Validate: ./tf.sh validate
- Plan: ./tf.sh plan
- Apply: ./tf.sh apply
- Destroy: ./tf.sh destroy

Profile selection
- Default profile is used automatically.
- To use another profile: AWS_PROFILE=my-profile ./tf.sh plan