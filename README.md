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

# Logic Reduction Algorithms
To get rid of redundancy in a logical knowledge base, you can use **logic reduction algorithms** or techniques from propositional and predicate logic. These methods ensure that the knowledge base is both minimal and logically equivalent to the original. Here's how you can systematically approach the problem:

---

## 1. **Simplify Logical Rules**
   Apply simplification rules to reduce redundancy in logical expressions:
   - **Idempotence**: \( A \land A \equiv A \), \( A \lor A \equiv A \)
   - **Identity**: \( A \land \text{true} \equiv A \), \( A \lor \text{false} \equiv A \)
   - **Domination**: \( A \land \text{false} \equiv \text{false} \), \( A \lor \text{true} \equiv \text{true} \)
   - **Absorption**: \( A \lor (A \land B) \equiv A \), \( A \land (A \lor B) \equiv A \)
   - **Double Negation**: \( \neg(\neg A) \equiv A \)

   **Example:**
   ```prolog
   % Original
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y), gave_knife(X, Z).

   % Simplified
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y).
   ```

---

## 2. **Remove Duplicate Facts**
   Ensure each fact appears only once in the knowledge base.

   **Example:**
   ```prolog
   % Original
   person(john).
   person(john).

   % Simplified
   person(john).
   ```

   Use Prolog's `setof/3` or `list_to_set/2` predicates to eliminate duplicate facts programmatically.

---

## 3. **Apply Logical Subsumption**
   If one rule subsumes another, remove the more specific rule.

   **Example:**
   ```prolog
   % Original
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y).
   responsible(john, mary) :- gave_knife(john, paul), killed(paul, mary).

   % Simplified
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y).
   ```

   The second rule is redundant because it is a special case of the first.

---

## 4. **Resolution and Refactoring**
   Use **resolution** to identify and remove redundant rules by combining them logically.

   **Example:**
   ```prolog
   % Original
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y).
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y), person(X).

   % Simplified
   responsible(X, Y) :- gave_knife(X, Z), killed(Z, Y).
   ```

---

## 5. **Eliminate Unused or Irrelevant Facts and Rules**
   Facts or rules that do not contribute to any query or are never used in derivations can be removed.

   **Example:**
   ```prolog
   % Original
   person(john).
   gave_knife(john, paul).
   killed(paul, mary).
   irrelevant_fact(foo).

   % Simplified
   person(john).
   gave_knife(john, paul).
   killed(paul, mary).
   ```

   Use tools like **static analysis** or query dependency graphs to identify unused facts or rules.

---

## 6. **Algorithm for Systematic Logic Reduction**
   Here’s a structured approach:
   1. **Identify duplicates**: Use predicates like `setof/3` or `bagof/3` to collect unique facts.
   2. **Simplify rules**: Apply logical simplifications and refactor rules to their minimal form.
   3. **Check for subsumption**: Remove rules that are subsumed by more general ones.
   4. **Remove irrelevance**: Analyze queries and remove facts/rules that do not contribute.
   5. **Validate equivalence**: Ensure the reduced knowledge base is logically equivalent to the original by testing against known queries.

---

## 7. **Tools for Automation**
   - **Logic Minimizers**: Tools from digital logic design (e.g., Quine-McCluskey) can simplify propositional logic.
   - **Custom Prolog Programs**: Write Prolog predicates to check for duplicates, subsumption, and rule equivalence.
   - **AI Tools**: Use constraint solvers to ensure logical consistency while removing redundancy.

---

By following these methods, you can efficiently reduce redundancy in a knowledge base while preserving its logical integrity.

## In Prolog, **facts are assumed to be well-established and true** 

by default within the scope of the knowledge base. This assumption underpins how Prolog operates as a logic programming language. However, the validity of facts depends on the context of the knowledge base and how it is constructed. Here’s a detailed breakdown of this assumption:

---

### 1. **Prolog's Closed-World Assumption**
   Prolog operates under the **closed-world assumption (CWA)**, meaning:
   - Anything not explicitly stated as a fact or derivable from rules is assumed to be false.
   - Facts are treated as universally true within the scope of the knowledge base unless explicitly negated or updated.

   **Example:**
   ```prolog
   person(john).
   ```

   - Query: `?- person(john).` → `true`
   - Query: `?- person(mary).` → `false` (since `person(mary)` is not stated).

---

### 2. **Trusting Facts**
   Facts are typically added to a knowledge base because they represent established truths about the domain being modeled. In practice:
   - Facts are **static declarations**: They do not change unless explicitly updated.
   - Users are responsible for ensuring that the facts represent accurate and valid data.

---

### 3. **Challenges with Assumptions**
   Assuming facts are well-established works well in controlled scenarios but can lead to problems in certain cases:
   - **Incomplete Knowledge**: The absence of a fact does not necessarily mean it is false, but Prolog assumes it is due to the CWA.
   - **Conflicting Facts**: If conflicting facts exist in the knowledge base, Prolog may yield unexpected or inconsistent results.
   - **Dynamic Environments**: If facts can change dynamically (e.g., in real-time systems), additional mechanisms like `assert/1` and `retract/1` are needed to manage updates.

   **Example of Conflicting Facts:**
   ```prolog
   is_happy(john).     % John is happy
   is_happy(john) :- false.  % John is not happy (conflict)
   ```

   Query: `?- is_happy(john).` may yield unexpected results.

---

### 4. **Validity in Prolog Facts**
   To ensure that facts are valid:
   - Facts should represent **domain truths** or **axioms** based on the problem being solved.
   - Conflicts or inconsistencies should be resolved during the construction of the knowledge base.
   - Incomplete knowledge can be managed using **negation-as-failure** (`\+` operator) or probabilistic extensions to Prolog.

---

### 5. **When Facts Are Not Assumed Well-Established**
   If facts cannot be assumed well-established, additional mechanisms can be employed:
   - **Dynamic Assertions**: Use `assert/1` and `retract/1` to manage facts dynamically.
   - **Probabilistic Logic**: Use libraries like ProbLog or PRISM to attach probabilities to facts.
   - **Explicit Fact Validation**: Use meta-programming to validate facts before querying them.

   **Example of Fact Validation:**
   ```prolog
   validate_fact(person(X)) :- person(X).
   validate_fact(_) :- write('Invalid fact'), fail.

   person(john).

   ?- validate_fact(person(john)).
   true.

   ?- validate_fact(person(mary)).
   Invalid fact
   false.
   ```

---

### 6. **Summary**
   - **Assumption**: Facts are treated as well-established and true under the closed-world assumption.
   - **User Responsibility**: Ensuring the accuracy and consistency of facts lies with the user or system managing the knowledge base.
   - **Handling Uncertainty**: Extensions or additional logic are required to handle cases where facts may not be well-established.

By adhering to these principles, Prolog remains a powerful tool for logical reasoning within its well-defined assumptions.

# To combine multiple knowledge bases in Prolog, you can either:

1. **Combine them manually** by copying and merging the facts and rules from the different files into a single knowledge base.
2. **Load multiple files dynamically** into the Prolog environment using the `consult/1` or `use_module/1` predicate.

Here's a breakdown of these methods:

---

### 1. Combine Manually
You can copy and paste the facts and rules from multiple knowledge bases into a single `.pl` file.

#### Example
If `knowledge_base1.pl` contains:
```prolog
person(john).
gave_knife(john, paul).
```

And `knowledge_base2.pl` contains:
```prolog
killed(paul, mary).
responsible(X, Y) :- 
    gave_knife(X, Z), 
    killed(Z, Y), 
    X \= Z.
```

You can combine them into a single file, `combined_knowledge_base.pl`:
```prolog
person(john).
gave_knife(john, paul).
killed(paul, mary).
responsible(X, Y) :- 
    gave_knife(X, Z), 
    killed(Z, Y), 
    X \= Z.
```

---

### 2. Dynamically Load Multiple Knowledge Bases
In Prolog, you can load multiple knowledge base files using the `consult/1` or `use_module/1` predicates.

#### Example
Suppose you have two files: `knowledge_base1.pl` and `knowledge_base2.pl`.

**Contents of `knowledge_base1.pl`:**
```prolog
person(john).
gave_knife(john, paul).
```

**Contents of `knowledge_base2.pl`:**
```prolog
killed(paul, mary).
responsible(X, Y) :- 
    gave_knife(X, Z), 
    killed(Z, Y), 
    X \= Z.
```

You can create a third file `main.pl` to load them:
```prolog
:- consult('knowledge_base1.pl').
:- consult('knowledge_base2.pl').
```

Then, run Prolog and consult `main.pl`:
```prolog
?- consult('main.pl').
true.
```

Now, all facts and rules from both `knowledge_base1.pl` and `knowledge_base2.pl` are loaded into the environment, and you can query them as a single knowledge base.

---

### Notes
1. **Avoid Naming Conflicts**: Ensure that predicates in different knowledge bases do not

conflict unless they are intentionally shared. If two files define the same predicate with different meanings, Prolog will use the most recently loaded definition, which can lead to unexpected behavior.

2. **Modular Design**: Use modules to organize your knowledge bases if you want to avoid predicate conflicts or provide encapsulation.

#### Example of Using Modules
File `knowledge_base1.pl`:
```prolog
:- module(kb1, [person/1, gave_knife/2]).

person(john).
gave_knife(john, paul).
```

File `knowledge_base2.pl`:
```prolog
:- module(kb2, [killed/2, responsible/2]).

killed(paul, mary).
responsible(X, Y) :- 
    kb1:gave_knife(X, Z), 
    killed(Z, Y), 
    X \= Z.
```

File `main.pl`:
```prolog
:- use_module(kb1).
:- use_module(kb2).
```

Run Prolog and load `main.pl`:
```prolog
?- consult('main.pl').
true.
```

Query with module prefixes:
```prolog
?- kb1:person(john).
true.

?- kb2:responsible(john, mary).
true.
```

This approach keeps the knowledge bases independent while allowing selective access to their predicates.

3. **Use File Paths**: Ensure the paths to the files are correct when consulting or using modules. If the files are in the same directory, relative paths suffice; otherwise, provide full paths or configure the Prolog library search path.

4. **Combine Dynamically with `assert/1`**: If needed, you can load facts dynamically during runtime using `assert/1`. For example:
   ```prolog
   load_kb1 :-
       assert(person(john)),
       assert(gave_knife(john, paul)).

   load_kb2 :-
       assert(killed(paul, mary)),
       assert((responsible(X, Y) :- 
           gave_knife(X, Z), 
           killed(Z, Y), 
           X \= Z)).
   ```

This way, you can conditionally load parts of a knowledge base based on the program's logic.

By using these methods, you can effectively manage and combine multiple knowledge bases in Prolog.


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

