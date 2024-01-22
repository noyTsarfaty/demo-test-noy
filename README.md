# demo-test-noy

Dear reviewer! 
Solution overview:
This solution is creating API gateway with a lambda function and a Github repo with webhook connected to the API Gateway.
1. State files are stored in S3 
2. 2 flows- create account and create repo. "create account" creates the lambda function and the API gateway. "create repo" creates a github repo and webhook to the API gateway. the invocation URL is read from "new account" state file outputs. 
3. Due to time constraints this is not a full solution but builds a base that can be easily expanded

future improvements:
1. support the creation of more that one repo using the "github_repo" module (the backend block key didnt support including vars in the "key" value (the path in S3) so I couldn't enable each creation to have a different path for state file) 
2. debug why webhook is getting 500 from the API GW. I created similar env in my AWS consul and it worked. When I changed API gateway (for example added a stage) it stopped working. This gave me cause to suspect that it might be related to the dependencies between the API resources and the lambda resources. Once creating the Lambda integration to the API GW and then changing the API GW- something is changed in the integration. 
2. read github token from secret manager 
3. Enhance security- add authentication to API gateway (maybe API key) to the communication with the API Gateway, same for lambda
4. create a dedicated log group in cloudwatch (instead of using the default) per repo and write the logs there (more clearly)
