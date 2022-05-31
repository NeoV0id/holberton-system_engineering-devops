#!/usr/bin/python3
""" Module for task 1 """

import requests


def top_ten(subreddit):
    """ This function will
        print the titles of the first 10 hot post
    """
    headers = {'User-Agent': 'nuwtts'}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    res = requests.get(url, headers=headers, params={'limit': 10})

    if res.status_code > 300:
        print("None")
        return

    results = res.json().get("data")

    for result in results.get("children"):
        print(result.get("data").get("title"))
