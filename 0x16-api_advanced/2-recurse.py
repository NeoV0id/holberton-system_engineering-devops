#!/usr/bin/python3
""" Module for task 2 """

import requests


def recurse(subreddit, hot_list=[], after=""):
    """ This function will
        print 10 hot titles of subreddit
    """
    headers = {'User-Agent': 'nuwtts'}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    params = {
        'limits': 100,
        'after': after,
    }
    res = requests.get(url, headers=headers, params=params)

    if res.status_code == 404:
        return None

    results = res.json().get("data")
    after = results.get("after")

    for result in results.get("children"):
        hot_list.append(result.get("data").get("title"))

    if after is not None:
        return recurse(subreddit, hot_list, after)

    return hot_list
