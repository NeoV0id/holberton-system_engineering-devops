#!/usr/bin/python3
""" Module for task 0 """

import requests


def number_of_subscribers(subreddit):
    """ function
        return: number of subscriber
    """
    headers = {'User-Agent': 'nuwtts'}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    res = requests.get(url, headers=headers)

    if res.status_code > 300:
        return 0

    return res.json().get("data").get("subscribers")
