#!/usr/bin/python3
import fileinput
import uuid
import json
import subprocess
import datetime

counter = 0
file = open("results.txt", "a")
for line in fileinput.input(['my-data-file.txt']):
	if not line:
		continue
		
	counter += 1
	jsonStr = {
		"key1": str(uuid.uuid4()),
		"key2": "FNAME" + str(counter),
		"key3": "LNAME" + str(counter),
		"key4": str(line).replace("\n",""),
		"key5": "2024-07-13T00:00:00Z"
	}
	jsonStr = [jsonStr]
	jsonArray = json.dumps(jsonStr, indent=2)
	subprocess.call(['bash','sqs-upload.sh',jsonArray, line])
	file.write(f"{datetime.datetime.now()} - enqueued json for email {line} {jsonArray}")
	file.write("\n\n")
file.close()
