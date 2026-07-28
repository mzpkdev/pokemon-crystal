MACRO rematch_schedule
	db \1, \2
ENDM

RematchSchedules::
	table_width 2
	; day, accepted time-of-day mask
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_MORNING   ; Jack
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_NIGHT     ; Huey
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_MORNING   ; Gaven
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_AFTERNOON ; Beth
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_NIGHT     ; Jose
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_MORNING   ; Reena
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_AFTERNOON ; Joey
	rematch_schedule TUESDAY,   REMATCH_SCHEDULE_NIGHT     ; Wade
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_MORNING   ; Ralph
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_AFTERNOON ; Liz
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_NIGHT     ; Anthony
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_MORNING   ; Todd
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_AFTERNOON ; Gina
	rematch_schedule TUESDAY,   REMATCH_SCHEDULE_MORNING   ; Arnie
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_AFTERNOON ; Alan
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_NIGHT     ; Dana
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_MORNING   ; Chad
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_NIGHT     ; Tully
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_MORNING   ; Brent
	rematch_schedule TUESDAY,   REMATCH_SCHEDULE_AFTERNOON ; Tiffany
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_NIGHT     ; Vance
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_MORNING   ; Wilton
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_AFTERNOON ; Parry
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_NIGHT     ; Erin
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_MORNING   ; Brandon (Ian role)
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_AFTERNOON ; Walt
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_MORNING   ; Krise
	rematch_schedule TUESDAY,   REMATCH_SCHEDULE_AFTERNOON ; Alfred
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_MORNING   ; Doug
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_MORNING   ; Rob
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_DAY_EVE   ; Kyle
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_NITE      ; Tanner
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_DAY_EVE   ; Kenny
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_DAY_EVE   ; Tim & Sue
	rematch_schedule TUESDAY,   REMATCH_SCHEDULE_NIGHT     ; Jamie
	rematch_schedule WEDNESDAY, REMATCH_SCHEDULE_NIGHT     ; Torin
	rematch_schedule FRIDAY,    REMATCH_SCHEDULE_NIGHT     ; Billy
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_NIGHT     ; Hillary
	rematch_schedule SATURDAY,  REMATCH_SCHEDULE_NIGHT     ; Kay & Tia
	rematch_schedule MONDAY,    REMATCH_SCHEDULE_MORNING   ; Aiden
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_AFTERNOON ; Dale (Eoin role)
	rematch_schedule SUNDAY,    REMATCH_SCHEDULE_NIGHT     ; Reilly (Reese role)
	rematch_schedule THURSDAY,  REMATCH_SCHEDULE_DAY_EVE   ; Kyler
	assert_table_length NUM_REMATCH_SCHEDULES
