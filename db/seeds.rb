ActivityType.create([{name: 'IN-OFFICE', keystroke: 1},
                     {name: 'DEV-HUDDLE', keystroke: 2},
                     {name: 'PAIRING', keystroke: 3},
                     {name: 'MEETING', keystroke: 4},
                     {name: 'TT', keystroke: 5},
                     {name: 'NOTHING', keystroke: 6},
                     {name: 'LEAVING-OFFICE', keystroke: 7}])
p "Created #{ActivityType.count} activity types"