#!/usr/bin/python3
import requests
import sys

from requests.auth import HTTPBasicAuth


def find_projects():
    global response
    exists_in = []
    projects = ["tsoft_tpanel", "tsoft_xserver", "tsoft_spring", "tsoft_convapi",
                "tsoft_event_notifications", "tsoft_webv2", "tsoft_web",
                "tsoft_partner_data_extractor", "tsoft_etl", "tsoft_scripts",
                "tsoft_consent_api", "tsoft_consent_ui", "tsoft_alertlog"]
    target_ticket = sys.argv[1]
    personal_access_token = ""

    for project in projects:
        url = "https://api.github.com/repos/revspring/" + str(project) + "/branches/" + str(target_ticket)

        try:
            response = requests.get(url, auth=HTTPBasicAuth('token', personal_access_token))
        except requests.ConnectionError as error:
            print(error)

        found = response.json()
        if found.get('name') is not None:
            exists_in.append(project)
            continue

    exists_in.sort()
    print("Ticket " + str(target_ticket) + " exists in the following projects: ")
    for project in exists_in:
        print(project)


if __name__ == '__main__':
    find_projects()
