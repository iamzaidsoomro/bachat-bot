import json

people = {
    "name": "Pawang",
    "age": 20,
    "hobbies": "Playing games",
    "likes": "a special person"
}

with open(r"E:\Web Scrapping\example.json", 'a') as f:
    json.dump(people, f)


print("done")


new_people = {
    "name": "Someone",
    "age": 45,
    "hobbies": "Playing games",
    "likes": "a normal person"
}

with open(r"E:\Web Scrapping\example.json", 'a') as f:
    json.dump(new_people, f)


print("done")