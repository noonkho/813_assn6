# 813_assn6
This is for Queen's University CISC 813 Course Assignment 6

# Team members
- E Ching (Noon) Kho, 17eck3@queensu.ca
- Andrew Boulos, 17ab86@queensu.ca
- Nathanael Yao, 18ny13@queensu.ca

# Inspiration
This domain was inspired by small gyms with limited equipment. Share the racks!

# Problem
This problem consists of two people, noon and john who want to exercise in the same gym. Each of them
have workout goals (The amount of time they want to exercise). However, there is only one of each type of
exercise equipment in the gym(rack, dumbells, etc). John and Noon will have to plan out how to share the equipment
to acheive their goals.

## Logic for the problem setup
- People are going to the gym!
- People will move from equipment area to equipment area
- They can only do exercise if they are at the equipment area and using the equipment
- People are just humn not machine, that's why people are taking breaks between each exercise
- To ensure people workout on different muscle, they can only work on an exercise for certain amount of sets (max-exercise-count = 2)

# Domain
## Predicate
There are **10** predicates:
- (not-exercising ?p - person)
- (current-exercise ?p - person ?e - exercise)
- (exercise-change ?e1 ?e2 - exercise)
- (idle ?p - person)
- (exercise-need ?e - exercise ?eq - equipment)
- (at ?p - person ?eq - equipment)
- (not-using ?eq - equipment)
- (location-change ?eq1 ?eq2 - equipment)
- (equal ?eq1 ?eq2 - equipment)
- (not-moving ?p - person)

## Functions
There are **6** functions:
- (exe-length ?l - length)
- (exe-count ?p - person ?e - exercise)
- (exe-duration ?p - person ?e - exercise)
- (workout_duration ?p - person)
- (max-exercise-count)
- (max-length-count ?l - length)

## Action
There are **3** actions:

- do-exercise
- take_break
- move_and_using

### do-exercise
The person is doing exercise
- The person can only do exercise if not exercising
- The person can only do that exercise if that exercise not exceed max exercise count
- The person has to be idle (not taking break)
- The person has the equipment to do the exercise
- The person is at the equipment area for that exercise

### take_break
In between exercises the person takes a break and switches exercises.
- When the person finishes an exercise, then they must idle
- After idling they can select another exercise to do

### move_and_using
This action makes a person move between equipment locations and use the equipment in that location.
- A person can only move and use an equipment if noone else is currently using it.


# Result
Here's the plan:

0.000: (take_break john warmup jj)  [1.000]
0.001: (move_and_using noon not_gym rack)  [30.500]
0.006: (move_and_using john not_gym a_space)  [30.500]
0.007: (do-exercise john a_space jj long)  [15.000]
0.008: (take_break noon warmup bp)  [1.000]
0.009: (do-exercise noon rack bp long)  [15.000]
14.504: (take_break noon bp bp)  [1.000]
14.505: (take_break john jj jj)  [1.000]
15.008: (do-exercise john a_space jj long)  [15.000]
15.503: (do-exercise noon rack bp long)  [15.000]
29.507: (take_break john jj squat)  [1.000]
30.009: (do-exercise john a_space squat long)  [15.000]
30.502: (take_break noon bp curls)  [1.000]
30.504: (move_and_using noon rack dumbell)  [30.500]
30.505: (do-exercise noon dumbell curls long)  [15.000]
45.007: (take_break noon curls curls)  [1.000]
45.008: (take_break john squat bp)  [1.000]
45.010: (move_and_using john a_space rack)  [30.500]
45.011: (do-exercise john rack bp long)  [15.000]
46.006: (do-exercise noon dumbell curls long)  [15.000]
61.005: (take_break noon curls jj)  [1.000]
61.007: (move_and_using noon dumbell a_space)  [30.500]
61.008: (do-exercise noon a_space jj long)  [15.000]
75.010: (take_break noon jj jj)  [1.000]
76.009: (do-exercise noon a_space jj long)  [15.000]



# Future work
- Add more equipment and people who want to exercise