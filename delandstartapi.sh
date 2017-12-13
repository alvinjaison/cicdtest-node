#!/bin/bash
#### Script to delete CICDApi

apigwid=($(aws --profile cct apigateway get-rest-apis | jq '.items[] | select(.name=="CICDNodeApi") | .id' | sed 's/"//g'))
if [ $? -ne 0 ]; then 
    aws --profile cct apigateway delete-rest-api --rest-api-id ${apigwid} --region us-east-2
fi

aws --profile cct apigateway delete-base-path-mapping --domain-name 'cicdtest-staging.appcohesion.io' --base-path 'CICDNodeApi'
aws --profile cct lambda delete-function --function-name cicdTestNode --region us-east-2
aws --profile cct codepipeline start-pipeline-execution --name CCTTest-Node --region us-east-2
