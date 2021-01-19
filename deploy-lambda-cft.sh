cd /home/ec2-user/hello-lambda/HelloLambda
git pull

zip hello.zip helloLambda.py
aws s3 cp hello.zip s3://hello-lambda-jk11/hello.zip
flag=$(aws cloudformation describe-stacks --stack-name hello-lambda-stack | jq --raw-output .Stacks[0].StackName)
echo $flag
if [ "$flag"  == "hello-lambda-stack" ]
 then
  echo "DELETING Hello-Lambda... "
  aws cloudformation update-stack --stack-name hello-lambda-stack --template-body file://delete-hello-lambda-cft.json --capabilities CAPABILITY_NAMED_IAM
  sleep 10
  echo "UPDATING Hello-Lambda..."
  aws cloudformation update-stack --stack-name hello-lambda-stack --template-body file://deploy-hello-lambda-cft.json --capabilities CAPABILITY_NAMED_IAM
 else 
  echo "CREATING Hello-Lambda....."
  aws cloudformation create-stack --stack-name hello-lambda-stack --template-body file://deploy-hello-lambda-cft.json --capabilities CAPABILITY_NAMED_IA$
fi
