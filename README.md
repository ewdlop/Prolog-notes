# Prolog-notes

## Repository Content and Purpose

This repository contains various Prolog files that cover different topics, including stereotypes, philosophy, psychology, and social dynamics. The purpose of this repository is to provide a collection of Prolog examples and knowledge bases that can be used for learning and reference.

## Directory Structure

The files are organized into directories based on topics for easy navigation:

- `Stereotypes/`
  - `americans_stereotypes.pl`: Prolog representation of stereotypes that Americans might hold about various countries.
- `Philosophy/`
  - `art_of_war.pl`: The Art of War with Hindu and Latin Concepts in Prolog.
  - `empiricism.pl`: Knowledge acquisition through experience (Empiricism).
- `Psychology/`
  - `cognitive_dissonance.pl`: Facts and rules about cognitive dissonance.
  - `false_admire.pl`: Identifying manipulation through false admiration.
  - `mechanisms_of_accountability_avoidance_and_social_perception_distortion.pl`: Psychological mechanisms knowledge base.
  - `narcissistic_behavior.pl`: Traits and relationships associated with narcissistic behavior.
  - `passive_aggressive.pl`: A Prolog knowledge base with passive-aggressive assertions.

## Instructions for Navigating the Repository

1. **Clone the Repository**: Use `git clone` to clone the repository to your local machine.
2. **Navigate to Directories**: Use the directory structure to find files related to specific topics.
3. **Open Files**: Open the Prolog files in your preferred text editor or IDE to view the code and comments.
4. **Run Prolog Code**: Use a Prolog interpreter (e.g., SWI-Prolog) to run the code and experiment with the examples.

## Example Queries

Here are some example queries you can run in a Prolog interpreter:

- To query the stereotype of a specific country:
  ```prolog
  ?- stereotype("France", Description).
  ```
- To find all stereotypes:
  ```prolog
  ?- stereotype(Country, Description).
  ```
- To check if Sun Tzu can achieve victory:
  ```prolog
  ?- victory(sun_tzu).
  ```
- To identify cognitive dissonance:
  ```prolog
  ?- cognitive_dissonance(john).
  ```
- To assess if someone is pretending to be a fan:
  ```prolog
  ?- pretending_to_be_fan(john, mary).
  ```
- To list all psychological mechanisms:
  ```prolog
  ?- mechanism(Name, description(Description), example(Example)).
  ```
- To check if someone is narcissistic:
  ```prolog
  ?- is_narcissistic(john).
  ```
- To find compatible individuals based on preferences:
  ```prolog
  ?- compatible(john, james).
  ```

## Additional Information

Each Prolog file contains comments and documentation explaining its purpose and usage. Feel free to explore the files and modify the code to suit your learning needs.

## Locke's Philosophy

[Locke's Philosophy](https://en.wikipedia.org/wiki/John_Locke)

## Prolog Facts and Rules Example

[Prolog Facts and Rules](https://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/factsrules.html)

```prolog
% Relational Database "Representation" in Prolog

% Define tables as facts
% Table: employees(employee_id, name, department_id)
employee(1, john, 101).
employee(2, mary, 102).
employee(3, tom, 101).
employee(4, susan, 103).

% Table: departments(department_id, department_name)
department(101, sales).
department(102, hr).
department(103, it).

% Foreign key relationship: employees.department_id -> departments.department_id

% Rule to join employees and departments (SQL equivalent: SELECT * FROM employees JOIN departments)
employee_department(EmployeeName, DepartmentName) :-
    employee(_, EmployeeName, DepartmentID),
    department(DepartmentID, DepartmentName).

% Queries:
% Who works in the Sales department?
% ?- employee_department(EmployeeName, sales).

% Which department does Tom work in?
% ?- employee_department(tom, DepartmentName).
```

## Contributing Guidelines

We welcome contributions to this repository! Here are some guidelines to help you get started:

1. **Fork the Repository**: Click the "Fork" button at the top right of this page to create a copy of this repository in your GitHub account.
2. **Clone Your Fork**: Use `git clone` to clone your forked repository to your local machine.
3. **Create a Branch**: Create a new branch for your changes using `git checkout -b branch-name`.
4. **Make Changes**: Make your changes to the code or documentation.
5. **Commit Changes**: Use `git commit -m "Description of changes"` to commit your changes.
6. **Push Changes**: Use `git push origin branch-name` to push your changes to your forked repository.
7. **Create a Pull Request**: Go to the original repository and click "New Pull Request" to submit your changes for review.

## Running and Testing Prolog Files

To run and test the Prolog files in this repository, follow these steps:

1. **Install SWI-Prolog**: Download and install SWI-Prolog from [SWI-Prolog's official website](https://www.swi-prolog.org/Download.html).
2. **Open SWI-Prolog**: Launch the SWI-Prolog interpreter.
3. **Load a Prolog File**: Use the `consult/1` predicate to load a Prolog file. For example:
   ```prolog
   ?- consult('path/to/your/file.pl').
   ```
4. **Run Queries**: Enter your queries at the Prolog prompt. For example:
   ```prolog
   ?- your_query_here.
   ```
5. **Debugging**: Use the built-in debugging tools in SWI-Prolog to troubleshoot and debug your code. You can set breakpoints, trace execution, and inspect variable bindings.

For more detailed information on using SWI-Prolog, refer to the [SWI-Prolog documentation](https://www.swi-prolog.org/pldoc/doc_for?object=manual).

