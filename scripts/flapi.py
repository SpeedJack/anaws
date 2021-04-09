#!/usr/bin/python
"""floodlight REST api"""

import json
import requests


def rest_call(path, data, action):
	"""API call"""
	headers = {
		'Content-type': 'application/json',
		'Accept': 'application/json',
	}

	url = 'http://127.0.0.1:8080' + path
	action = action.lower()
	response = None
	print()
	print(action.upper(), path, json.dumps(data))
	if action == 'get':
		response = requests.get(url, headers=headers)
	elif action == 'post':
		response = requests.post(url, json=data, headers=headers)
	elif action == 'put':
		print('TODO!')
		return
	elif action == 'delete':
		print('TODO!')
		return
	else:
		print('Invalid action.')
		return
	print()
	print('Response Status Code:', response.status_code)
	print('----- Response:')
	jsonresp = json.loads(response.text)
	print(json.dumps(jsonresp, indent=4, sort_keys=True))
	print('---------------')


if __name__ == "__main__":
	print('Docs:', 'https://floodlight.atlassian.net/wiki/spaces/floodlightcontroller/pages/1343539/Floodlight+REST+API')
	while True:
		uri = input('uri: ')
		act = input('method: ')
		if act is None or act == '':
			act = 'get'
		args = input('args: ')
		if args is None or args == '':
			args = {}
		else:
			args = eval(args)
		rest_call(uri, args, act)
		print()
