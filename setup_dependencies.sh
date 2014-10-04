mkdir ~/codedeploy
cd ~/codedeploy
sed -i 's/aws sds/aws deploy/g' ~/bin/sds_deployment_check
pip install awscli
aws s3 cp --recursive s3://razorbill-us-east-1-prod-default-distribution/latest .
pip install sds-awscli-1.3.8.tar.gz
mkdir -p /tmp/botocore/data/aws/deploy
export AWS_DATA_PATH=/tmp/botocore/data
cd /tmp/botocore/data/aws/deploy/
aws s3 cp s3://razorbill-us-east-1-prod-default-distribution/latest/2014-10-06.json .
export AWS_DATA_PATH=/tmp/botocore/data
cd ~/clone
aws deploy list-applications
