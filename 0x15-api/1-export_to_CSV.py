#!/usr/bin/python3
""" Module for task 1 """


if __name__ == "__main__":

    import csv
    import requests
    import sys

    UserId = sys.argv[1]
    user = requests.get("https://jsonplaceholder.typicode.com/users/{}"
                        .format(UserId))
    name = user.json().get("username")

    task_id = []
    tasks = requests.get("https://jsonplaceholder.typicode.com/todos")

    for i in tasks.json():
        if i.get("userId") == int(UserId):
            task_id.append([UserId, name, i.get("completed"),
                            i.get("title")])

    filename = "{}.csv".format(sys.argv[1])
    with open(filename, 'w') as f:
        writer = csv.writer(f, delimiter=",", quotechar='"',
                            quoting=csv.QUOTE_ALL)

        for j in task_id:
            writer.writerow(j)
