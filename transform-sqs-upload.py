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
		"vendorAppointmentId": str(uuid.uuid4()),
		"firstName": "FNAME" + str(counter),
		"lastName": "LNAME" + str(counter),
		"emailAddress": str(line).replace("\n",""),
		"appointmentDateTime": "2024-07-13T00:00:00Z"
	}
	jsonStr = [jsonStr]
	jsonArray = json.dumps(jsonStr, indent=2)
	subprocess.call(['bash','sqs-upload.sh',jsonArray, line])
	file.write(f"{datetime.datetime.now()} - enqueued json for email {line} {jsonArray}")
	file.write("\n\n")
file.close()
