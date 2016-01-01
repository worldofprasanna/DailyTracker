ActivityType.create([{name: 'IN-OFFICE', keystroke: 1},
                     {name: 'DEV-HUDDLE', keystroke: 2},
                     {name: 'PET-PROJECT', keystroke: 3},
                     {name: 'PAIRING', keystroke: 4},
                     {name: 'MEETING', keystroke: 5},
                     {name: 'TT', keystroke: 6},
                     {name: 'NOTHING', keystroke: 7},
                     {name: 'DEV-NEWS', keystroke: 8}])
p "Created #{ActivityType.count} activity types"