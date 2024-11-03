The Wikipedia page you linked refers to **Modal Logic** (成唯識論 in Chinese), which is a system of logic that extends classical logic to include modalities, such as **necessity** and **possibility**. This concept is often explored in philosophical and linguistic contexts, but also has implications in **Prolog** for constructing logical programs with a modal perspective.

To incorporate modal concepts into **Prolog**, you can add **predicate definitions** to represent necessary and possible truths. Modal logic isn’t natively supported in Prolog, but you can simulate it through **custom predicates**.

Here’s an example of how you might represent **necessity** and **possibility** in Prolog by defining predicates:

### Simulating Modal Logic in Prolog

Let’s define two basic modal operators:
1. **necessary(X)**: Represents that `X` is necessarily true.
2. **possible(X)**: Represents that `X` is possibly true.

#### Step 1: Define Basic Predicates

Let’s assume that we have some facts about certain statements being true or false. We can use rules to define **necessary** and **possible** statements.

```prolog
% Basic Facts
fact(sky_is_blue).
fact(sun_rises_in_east).
fact(gravity_exists).

% Necessary Predicate: Something is necessary if it is a fact that cannot be contradicted.
necessary(X) :- fact(X).

% Possible Predicate: Something is possible if it is consistent with our known facts.
possible(X) :- fact(X).
possible(X) :- not(fact(not(X))).
```

In this code:
- **fact(sky_is_blue)** states that “the sky is blue” is a fact.
- **necessary(X)** is defined such that `X` is necessary if it’s a fact that cannot be contradicted.
- **possible(X)** allows us to check if something is possible by verifying that it’s either a known fact or not known to be false.

#### Step 2: Adding Hypotheticals or Negations

To extend the program to handle **possibility** in a broader sense, we might add rules for **negations** and **hypothetical situations**.

```prolog
% Negation Facts
fact(not(sky_is_green)).
fact(not(sun_rises_in_west)).

% Update possible Predicate for Negation
possible(X) :- not(fact(not(X))).
```

Now we can check if a statement is “possible” by seeing if we don’t have an explicit fact contradicting it.

#### Step 3: Using Modal Logic for Reasoning

You can now use these predicates to **query modal logic properties** in Prolog:

```prolog
% Query if it's necessary that the sky is blue
?- necessary(sky_is_blue).
% Expected: true.

% Query if it's possible that gravity exists
?- possible(gravity_exists).
% Expected: true.

% Query if it's possible that the sky is green
?- possible(sky_is_green).
% Expected: false, since fact(not(sky_is_green)) exists.
```

### Extending Modal Logic in Prolog with Nested Modalities

In more complex modal systems, you might want to explore **nested modalities** (e.g., it’s possible that it’s necessary for something to be true). You can define rules that build upon each other to add this functionality:

```prolog
% Nested Modalities Example
possible(necessary(sky_is_blue)) :- necessary(sky_is_blue).
```

With this, you could query if it’s possible that it’s necessary for the sky to be blue.

---

### Summary
In Prolog, modal logic isn’t a built-in feature, but you can simulate it with custom predicates like `necessary` and `possible`. This approach allows you to use Prolog to model logical statements involving necessity and possibility by encoding facts and applying rules to check for contradictions or affirmations. This kind of reasoning can be applied to philosophical, linguistic, or artificial intelligence applications where modality is relevant.
