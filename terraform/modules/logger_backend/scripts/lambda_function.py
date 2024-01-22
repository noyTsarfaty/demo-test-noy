import json

def lambda_handler(event, context):
    body_part = json.loads(event['body'])
    print("body_part is : {}".format(body_part))
    repository_name = body_part['repository']['name']
    print("The repo name : {}".format(repository_name))

    # count_of_stars = body_part['repository']['stargazers_count']
    # print("The count of stars : {}".format(count_of_stars))
    #
    # user_who_gave_star = body_part['sender']['login']
    # print("The user who gave star : {}".format(user_who_gave_star))
    #
    # url_of_the_user_who_gave_star = body_part['sender']['html_url']
    # print("The profile of the user : {}".format(url_of_the_user_who_gave_star))

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }

    # body = json.loads(event['body'])
    # print("body_part is : {}".format(body))
    # repository_name = body['repository']['name']
    # print("The repo name : {}".format(repository_name))
    #
    # # count_of_stars = body_part['repository']['stargazers_count']
    # # print("The count of stars : {}".format(count_of_stars))
    #
    # # Check if the event is a PullRequestEvent and the action is 'closed'
    # if event['headers']['X-GitHub-Event'] == 'pull_request' and body['action'] == 'closed':
    #     # Check if the pull request was merged
    #     if body['pull_request']['merged']:
    #         # Get the list of changed files
    #         changed_files = [file['filename'] for file in body['pull_request']['files']]
    #
    #         # Your webhook logic for when any pull request is merged
    #         print("Webhook triggered for merged pull request")
    #         print("Changed files:")
    #         for changed_file in changed_files:
    #             print(changed_file)
    #         # Your actual webhook processing code goes here
    # # Respond to the incoming webhook
    # response = {
    #     'statusCode': 200,
    #     'body': json.dumps('Webhook processed successfully'),
    # }
    #
    # return response
# def add_logs_to_cloudwatch_log_group(log_group_name, log_stream_name, log_message, region, profile="local", create_log_group_if_missing=True):
#     print("inside add_logs_to_cloudwatch_log_group")
#     session = boto3.Session(profile_name=profile, region_name=region)
#     client = session.client('logs')
#     # Check if the log group exists; if not, create it
#     if create_log_group_if_missing:
#         try:
#             response = client.create_log_group(logGroupName=log_group_name)
#         except client.exceptions.ResourceAlreadyExistsException:
#             print(f"Log group {log_group_name} already exists")
#     try:
#         client.create_log_stream(
#             logGroupName=log_group_name,
#             logStreamName=log_stream_name
#         )
#     except client.exceptions.ResourceAlreadyExistsException:
#         print(f"Log group {log_stream_name} already exists. Adding to it")
#     # Put a log event in the log stream
#     client.put_log_events(
#         logGroupName=log_group_name,
#         logStreamName=log_stream_name,
#         logEvents=[
#             {
#                 'message': log_message
#             }
#         ]
#     )
#     print(f"Successfully added log {log_message} to log group: {log_group_name} log stream: {log_stream_name}")