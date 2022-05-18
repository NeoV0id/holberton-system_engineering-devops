#!/usr/bin/python3
""" Module for task 1 """
import csv
import requests
import sys


if __name__ == "__main__":
    UserId = sys.argv[1]
    user = requests.get("https://jsonplaceholder.typicode.com/users/{}"
                        .format(UserId))
    name = user.json().get("username")

    task_id = []
    tasks = requests.get("https://jsonplaceholder.typicode.com/todos")
    for task in tasks.json():
        if task.get("userId") == int(UserId):
            task_id.append([UserId, name, task.get("completed"),
                            task.get("title")])

    filename = "{}.csv".format(sys.argv[1])
    with open(filename, 'w') as f:
        writer = csv.writer(f, delimiter=",", quotechar='"',
                            quoting=csv.QUOTE_ALL)
        for task in task_id:
            writer.writerow(task)
