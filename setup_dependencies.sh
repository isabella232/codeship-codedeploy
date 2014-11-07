#!/bin/bash

set -e
set -x

pip install awscli
sed -i 's/aws sds/aws deploy/g' ~/bin/sds_deployment_check
mkdir -p /tmp/botocore/data/aws/codedeploy/
cd /tmp/botocore/data/aws/codedeploy/
aws s3 cp s3://razorbill-us-east-1-prod-default-distribution/latest/2014-10-06.api.json .
export AWS_DATA_PATH=/tmp/botocore/data
aws s3 cp --recursive s3://razorbill-us-east-1-prod-default-distribution/latest .
ls -lA
pip install awscli-1.5.4.tar.gz
aws deploy list-applications
cd ~/clone
