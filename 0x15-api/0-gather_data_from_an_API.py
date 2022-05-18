#!/usr/bin/python3
""" Module for task 0 """

import urllib
import sys
import requests

if __name__ == '__main__':
    UserId = int(sys.argv[1])
    user = requests.get("https://jsonplaceholder.typicode.com/users/{}"
                         .format(UserId))
    name = user.json().get("name")

    tasks = 0
    taskComplete = []
    RemainingTasks = requests.get("https://jsonplaceholder.typicode.com/todos")
    for i in RemainingTasks.json():
        if i.get("userId") == int(UserId):
            tasks ++
            if i.get("completed"):
                taskComplete.append(i)

    print("Employee {} is done with tasks({}/{}):"
          .format(name, len(taskComplete), tasks))
    for j in taskComplete:
        print("\t {}".format(task.get("title")))