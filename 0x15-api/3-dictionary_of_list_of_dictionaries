#!/usr/bin/python3
"""Exports data in the JSON format"""

if __name__ == "__main__":

    import json
    import requests
    import sys

    users = requests.get("https://jsonplaceholder.typicode.com/users")
    users = users.json()
    todos = requests.get('https://jsonplaceholder.typicode.com/todos')
    todos = todos.json()
    todoAll = {}

    for i in users:
        taskList = []
        for j in todos:
            if i.get('userId') == i.get('id'):
                taskDict = {"username": i.get('username'),
                            "task": j.get('title'),
                            "completed": j.get('completed')}
                taskList.append(taskDict)
        todoAll[i.get('id')] = taskList

    with open('todo_all_employees.json', mode='w') as f:
        json.dump(todoAll, f)
