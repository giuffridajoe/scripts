#!/bin/bash
echo Starting SQS script
echo Enqueuing for email "$2"
aws sqs send-message --profile [profile] --queue-url [url] --message-body "$1" --message-group-id [group id] --message-attributes 'Something={DataType=String, StringValue="else"}'
echo Finished
echo
