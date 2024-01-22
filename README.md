# demo-test-noy

Dear reviewer! 
Solution overview:
This solution is creating API gateway with a lambda function and Github repo with webhook connected to the API Gateway.
1. State files are stored in S3 
2. 2 flows- create account and create repo. "create account" is creating the lambda function and the API gateway. "create repo" is creating a github repo and webhook to the API gateway. the invokation URL read from "new account" state file outputs. 
3. Due to time constraints this is not a full solution but builds a base that can be easily expanded

future improvements:
1. support in creation of more that one repo using the "github_repo" module (the state file key didnt allow including vars in it so I couldn't modify that each creation will have different path for state file) 
2. debug why webhook is getting 500 from the API GW. I created similar env in my AWS consul and found out that it might be related to the dependencies between the API and the lambda resources. Once creating the Lambda integration to the API GA and then changing the API GW- something is changed in the integration. 
2. read github token from secret manager 
3. Enhance security- add authentication to API gateway (maybe API key) to the communication with the API Gateway, same for lambda
4. create a dedicated log group in cloudwatch (instead of using the default) per repo and write the logs there (more clearly)
