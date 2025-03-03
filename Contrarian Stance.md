# Contrarian Stance

## I am such and such because such and such don’t say so.

That phrase flips **circular reasoning** into a **paradoxical or contrarian stance**—it suggests that one's identity or truth is defined by the absence or negation of an external validation.

### **Interpretations:**
1. **Contrarian Logic**:  
   - "I am great because my critics don’t acknowledge it."  
   - "I am right because the establishment refuses to say so."  
   - This reflects **rebellious thinking** where the **lack of validation itself** becomes proof.

2. **Absurdism/Irony**:  
   - "I exist because no one says I do."  
   - "I am the chosen one because no prophecy mentions me."  
   - This has a **philosophical** or **humorous** undertone, poking fun at how authority or recognition is often arbitrary.

3. **Linguistic Trap (Self-Defeating Statement)**:  
   - If the truth of something depends on what is **not** said, then anything could be true under this reasoning.  
   - "I am invisible because nobody talks about me" doesn’t make literal sense.

---

### **Philosophical Implication:**
This phrase resembles **apophatic reasoning** (via negativa)—defining something **by what it is not** rather than what it is. It also flirts with **logical negation paradoxes**, like:

- "This statement is false."
- "The rule is that there are no rules."

Would you like this applied to a specific context (e.g., philosophy, humor, social commentary)?

## Prolog

Could you clarify what you would like in Prolog? Are you asking for a Prolog implementation related to logical paradoxes, power series coefficients, or something else entirely?

## For the contrarian stance

I will create a Prolog representation of a contrarian stance, where a statement is considered true if its negation is not explicitly stated. This will demonstrate logical negation and self-referential logic in Prolog.

I’ll share the code once it’s ready.

# Contrarian Stance in Prolog: Truth by Absence of Contradiction

## Prolog's Default Assumption vs. Contrarian Logic
Prolog typically operates under the **closed-world assumption**, meaning that anything it cannot prove true is assumed false by default ([PROLOG Facts, Rules and Queries](http://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/factsrules.html#:~:text=Closed%20World%20Assumption,it%20is%20being%20asked%20about)). This behavior is known as *negation as failure*. In other words, if a fact isn't in the knowledge base (or derivable from it), Prolog concludes the fact is false. 

- *Closed-world example:* If you ask Prolog whether a certain fact is true and there's no rule or fact supporting it, Prolog responds **false** (assuming the fact is not true) ([PROLOG Facts, Rules and Queries](http://www.cs.trincoll.edu/~ram/cpsc352/notes/prolog/factsrules.html#:~:text=Closed%20World%20Assumption,it%20is%20being%20asked%20about)).  
- **Contrarian stance:** We *flip* this reasoning. We assume a fact is true *unless* we have evidence (an explicit negation) that it’s false. In other words, *a statement is true if its negation is not proven*. This is a non-standard (non-monotonic) logic approach that we can model with Prolog's negation operator.

## Implementing a "True-by-Default" Rule
In Prolog, logical negation is expressed with `\+` (pronounced "not") which succeeds when its argument cannot be proven. Using this, we can define a rule that considers a fact true if there's no proof of its negation:

```prolog
% A fact is true by default if its negation cannot be found.
true_by_default(Fact) :- \+ negated(Fact).
```

**How this works:** The predicate `negated(Fact)` represents an *explicit contradiction* for `Fact`. The rule `true_by_default(Fact)` will succeed if `negated(Fact)` cannot be proven (i.e., `negated(Fact)` is not stated in the knowledge base). The `\+` operator here implements the contrarian logic: it checks that `Fact` is *not* known to be false. If no contradiction for `Fact` is found, Prolog treats `Fact` as true by default.

## Example Knowledge Base and Queries
Let's add some example facts to illustrate the contrarian rule in action. We'll explicitly mark certain statements as false using the `negated/1` predicate. Anything not marked `negated` will be assumed true by default:

```prolog
% Explicit negations (contradictions) in our knowledge base:
negated(santa_exists).      % We state that Santa does not exist.
negated(flat_earth).        % We state that "the earth is flat" is false.

% The contrarian truth rule (as defined above):
true_by_default(Fact) :- \+ negated(Fact).
```

Now, consider some queries and their outcomes:

- **Query**: `?- true_by_default(santa_exists).`  
  **Explanation**: Prolog checks `\+ negated(santa_exists)`. Since `negated(santa_exists)` *is* in the database, the negation fails (meaning we *can* prove Santa's existence is negated). Therefore, `true_by_default(santa_exists)` **fails**, correctly indicating that `santa_exists` is not considered true (because we had a contradiction for it).

- **Query**: `?- true_by_default(alien_life).`  
  **Explanation**: Prolog checks `\+ negated(alien_life)`. We have *no* fact `negated(alien_life)` in the knowledge base, so the negation succeeds (Prolog finds no proof that alien life is false). Thus, `true_by_default(alien_life)` succeeds, treating `alien_life` as true by default (since its negation is absent).

In summary, any `Fact` not explicitly marked with `negated(Fact)` will satisfy `true_by_default(Fact)` and be considered true under this contrarian rule. Facts that do have a corresponding `negated(...)` entry will not be assumed true.

## Self-Referential Example with Negation 
To illustrate self-referential logic in this contrarian style, consider two predicates that reference each other through negation:

```prolog
happy(alice)   :- \+ unhappy(alice).
unhappy(alice) :- \+ happy(alice).
```

Here we have a **circular, self-referential definition**:
- `happy(alice)` is true if we cannot prove `unhappy(alice)`.  
- `unhappy(alice)` is true if we cannot prove `happy(alice)`.

This models a scenario where Alice is assumed happy by default unless there's evidence she's unhappy, and vice versa. The two rules depend on each other’s negation. 

**How Prolog evaluates this:** If you query `?- happy(alice).`, Prolog will try to prove `unhappy(alice)` to see if there's a contradiction. To prove `unhappy(alice)`, it in turn checks `\+ happy(alice)`. This creates a loop: `happy(alice)` depends on `unhappy(alice)` not being provable, and `unhappy(alice)` depends on `happy(alice)` not being provable. Under Prolog's depth-first search evaluation, neither can be established as true because each one assumes the absence of the other. In practice, both `happy(alice)` and `unhappy(alice)` will fail to prove (answer **false** to queries) in a typical Prolog system. This outcome makes sense because we have no base fact to ground either predicate – it's a purely self-referential default assumption.

**Key takeaways from this example:** 
- The truth of each statement is based on the absence of the other, demonstrating a contrarian reasoning pattern.  
- This kind of logic is non-monotonic and can lead to ambiguous situations (much like a paradox). In more advanced logic programming (e.g., using answer set semantics), such a pair of rules might yield multiple *stable models* (one where Alice is happy by default, another where she is unhappy by default). Standard Prolog, however, will simply report that it cannot prove either. 

## Conclusion
Using Prolog's negation (`\+`) and the idea of negation-as-failure, we created a contrarian rule that assumes a fact true if its negation is not known. The example above demonstrates how this rule works in practice and how self-referential negation can illustrate the intricacies of such reasoning. This approach highlights a form of logical inference where the *absence* of a contradiction serves as evidence of truth, showcasing Prolog's ability to model non-standard logic behavior.
