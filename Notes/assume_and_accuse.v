Theorem assume_and_accuse :
  forall (P: Prop), 
  (assume P -> accuse others P) -> exists others, assume others P.
Proof.
  intros.
  exists others.
  assumption.
Qed.
