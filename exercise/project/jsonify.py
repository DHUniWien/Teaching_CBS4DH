import json
import re
import sys

people = []
with open('2011deaths.txt') as f:
    for line in f:
        person = None
        regex = r'^\* \[\[(.*?)\]\] &ndash; \[\[(.*?)\]\], (.*)\(b. (.*)\)'
        if re.match('^\*', line):
            # Grab the information out of the line
            info = re.match(regex, line)
            if info is None:
                print("Skipping unmatched line " + line, file=sys.stderr)
            else:
                date = info.group(1).split()
                name = info.group(2).split('|')
                desc = info.group(3).strip()
                born = info.group(4).replace('[', '').replace(']', '')
                link = name[0].replace(' ', '_')
                person = {
                    'link': 'https://en.wikipedia.org/wiki/' + link,
                    'name': name[1] if len(name) > 1 else name[0],
                    'day': date[1],
                    'month': date[0],
                    'profession': desc,
                    'birthyear': born
                }
            if person is not None:
                people.append(person)

print(json.dumps(people, indent=2))
