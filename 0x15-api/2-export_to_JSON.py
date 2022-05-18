#!/usr/bin/python3
""" Module for task 2 """
import json
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
            task_d = {"task": task.get("title"),
                      "completed": task.get("completed"), "username": name}
            task_id.append(task_d)

    filename = "{}.json".format(sys.argv[1])
    task_d = {UserId: task_id}
    with open(filename, 'w') as f:
        json.dump(task_d, f)
