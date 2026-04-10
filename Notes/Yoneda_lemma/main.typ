#import "../math_template.typ" : *

#show : start.with(
  title   : "Musings about the Yoneda lemma",
  author  : "Soham Saha"
)

#let Hom = "Hom"

First have a look at the Wikipedia article on the Yoneda lemma. Then have a look at what Mazur has to say about it (referred below). Also, this is what Wikipedia tells us about the Yoneda _embedding_:

#image("yoneda_embedding.png")

And now, let me unleash #tbold[my understanding] upon the unsuspecting world.

#divdash

#rect(width:100%)[
  Given any locally small category $C$, there is a #pnote[fully faithful] contravariant functor (called the Yoneda embedding) from $C$ to the category of (covariant) functors from $C$ to #cat[Set].
]

#let hdot = $h_circle.filled.small$

This contravariant functor can instead be thought of as a covariant functor $hdot: C^"op"->[C,mbold("Set")]$, where $[A,B]$ is the category of (covariant) functors from $A$ to $B$.

$hdot$ consists of an object map $hdot_obj:obj(C^"op")->obj([C, mbold("Set")])$, defined as $ A|->&h_A\ &=Hom_C (A,-)\ &=(forall B in obj(C), B|->Hom_C (A,B)), $ and a morphism map $hdot_"mor":Hom_(C^"op")(A,B)=Hom_C (B,A)->"Nat"(h_A,h_B)$, defined as $ f |-> (forall X in obj(C), X|->(forall g in Hom(A,X), g|->g compose f) )  $

If the morphism map $hdot_"mor"$ seems like a lot to unpack, check the type at each stage. Given $f in Hom_C (B,A)$, $hdot_"mor"$ needs to produce a natural transformation from $h_A$ to $h_B$. The natural transformation should convert $X in obj(C)$ to a morphism (in #mbold[Set]) from $Hom(A,X)$ to $Hom(B,X)$. Given $g in Hom(A,X)$, the produced element of $Hom(B,X)$ is $g compose f$. 

#divdash

Now, let us discuss the #tbold[fullness and faithfulness] of $hdot$. The Yoneda lemma tells us that given a functor $F$ from $C$ to #mbold[Set], $ forall A in obj(C),"Nat"(h_A, F) isom F(A). $

Now, in the case when $F$ is also, some hom-functor $h_B$, this reduces to $ forall A,B in obj(C), "Nat"(h_A,h_B) isom h_B (A)=Hom_C (B,A)=Hom_(C^"op")(A,B), $ which is _exactly_ what we needed! A one-to-one correspondence between hom-sets in $C^"op"$ (the domain of $hdot$), and $"Nat"(h_A,h_B)$, i.e., the corresponding hom-sets in $[C,mbold("Set")]$ (the codomain of $hdot$).   

#divdash

$hdot$ being a fully faithful functor means that $C^"op"$ is isomorphic to a full subcategory of $[C,mbold("Set")]$. The objects of this subcategory are exactly the hom-functors on $C$. Such functors are called representable functors.

#div

References:
- https://en.wikipedia.org/wiki/Yoneda_lemma
- _When is one thing equal to some other thing?_, Barry Mazur (Section 14, pg. 18-19)
- https://mathoverflow.net/q/3184 (Very nice answers and resources here).
- _Categories for the Working Mathematician_, Saunders MacLane (Chapter I, Section 3, "Functors") [Contains discussion about fullness and faithfulness of functors]
- https://en.wikipedia.org/wiki/Hom_functor
- https://en.wikipedia.org/wiki/Representable_functor
