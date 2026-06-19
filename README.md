# AI4RO2_Assignment_D3-V4
Warehouse Robotics – Capacity Constrained Transport (PDDL & PDDL+)

This project was developed for the AI4RO2 course and models a warehouse package delivery scenario using PDDL and PDDL+.

## Project Overview

The objective is to plan the delivery of packages by one or more warehouse robots while respecting weight and size capacity constraints. The planner must determine how to batch packages efficiently and generate valid delivery plans.

Two domain models are provided:

### Classical PDDL (Q1 folder): 
models robot navigation, package loading/unloading, and capacity constraints using numeric fluents.
### PDDL+ (Q2 folder): 
extends the classical model with temporal processes and events, introducing realistic loading/unloading durations and runtime capacity monitoring.

## Main Features
Multiple robots, packages, and warehouse locations
Weight and size capacity constraints
Package batching strategies
Numeric fluents for robot load management
Temporal loading/unloading processes (PDDL+)
Automatic overload detection through events (PDDL+)

## Repository Structure
├── PDDL/
│   ├── domain.pddl
│   ├── problem1.pddl
│   ├── problem2.pddl
│   └── problem3.pddl
│
├── PDDL+/
│   ├── domain.pddl
│   ├── problem1.pddl
│   ├── problem2.pddl
│   └── problem3.pddl

## Planner

The project was primarily tested using ENHSP, which provides support for the numeric fluents and quantifiers required by the domain. Some planners (e.g., Fast Downward) do not fully support all the modelling features used in this implementation.

## HOW TO RUN
(inside the correct folder)
-java -jar ~/AI2/ENHSP-Public/enhsp.jar -o warehouse_robotics-domain.pddl -f problem3.pddl
