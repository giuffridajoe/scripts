#!/usr/bin/python3
import requests
import sys
from requests.auth import HTTPBasicAuth


def find_projects():
    exists_in = []
    projects = ["tsoft_tpanel", "tsoft_xserver", "tsoft_spring", "tsoft_convapi",
                "tsoft_event_notifications", "tsoft_webv2", "tsoft_web",
                "tsoft_partner_data_extractor", "tsoft_etl", "tsoft_scripts",
                "tsoft_consent_api", "tsoft_consent_ui", "tsoft_alertlog"]
    target_ticket = sys.argv[1]
    personal_access_token = "INSERT PERSONAL ACCESS TOKEN HERE"

    for project in projects:
        url = "https://api.github.com/repos/revspring/{}/branches".format(project)

        try:
            all_branches = requests.get(url, auth=HTTPBasicAuth('token', personal_access_token))
        except requests.ConnectionError as error:
            print(error)

        for branch in all_branches.json():
            if branch['name'] == target_ticket:
                exists_in.append(project)
                break

    print("Ticket " + str(target_ticket) + " exists in the following projects: ")
    for project in exists_in:
        print(project)


if __name__ == '__main__':
    find_projects()
