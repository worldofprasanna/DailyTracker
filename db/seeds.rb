ActivityType.create([{name: 'IN-OFFICE', keystroke: 1, overlapping: true},
                     {name: 'DEV-HUDDLE', keystroke: 2, overlapping: false},
                     {name: 'PET-PROJECT', keystroke: 3, overlapping: false},
                     {name: 'PAIRING', keystroke: 4, overlapping: false},
                     {name: 'MEETING', keystroke: 5, overlapping: false},
                     {name: 'TT', keystroke: 6, overlapping: false},
                     {name: 'NOTHING', keystroke: 7, overlapping: false},
                     {name: 'DEV-NEWS', keystroke: 8, overlapping: false}])
p "Created #{ActivityType.count} activity types"