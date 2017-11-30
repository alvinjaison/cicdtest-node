#!/bin/bash
#### Script to delete CICDApi

export AWS_ACCESS_KEY_ID=AKIAJRNLY7NC437WMGOA
export AWS_SECRET_ACCESS_KEY=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

apigwid=($(aws --profile gunbro apigateway get-rest-apis | jq '.items[] | select(.name=="CICDApi") | .id' | sed 's/"//g'))
if [ $? -ne 0 ]; then 
    aws --profile gunbro apigateway delete-rest-api --rest-api-id ${apigwid} --region us-east-2
fi

aws --profile gunbro lambda delete-function --function-name CICDFunction --region us-east-2
aws --profile gunbro codepipeline start-pipeline-execution --name AppCoApiPL --region us-east-2
