#import "../math_template.typ" : *
#import "@preview/commute:0.3.0" : *
//Can do rough sketching on https://t.yw.je/

#show : start.with(
  title   : "Adjoints",
  author  : "Soham Saha"
)

_We will be using ideas from the discussion on *Free constructions*. Use the following examples for thinking concretely: #pnote[free groups made from sets, and vector spaces as free constructions on their basis sets.]_

// First, let us have a look at what the Wikipedia motivation for adjoint functors:

// #align(center,image("adjoint_motivation.png"))

Consider the forgetful functor $U$ (for "underlying") from $cat(D)=cat("Grp")$ to $cat(C)=cat("Set")$. We want to create a functor $F:cat(C)->cat(D)$ such that the object map of this functor is the "create free construction" map, i.e., for an arbitrary set $X in obj(cat(C))$, $F(X)$ would be a free group based on $X$.

Observe that in order for free constructions to exist, we must have universal morphisms from every $X in obj(cat(C))$ to the forgetful functor $U$ (Since we cannot just take it for granted that $!_X arrow.b U$ will have initial objects). For an arbitrary $X$, let us denote one of the universal morphisms from $X$ to $U$ as $(hat(X), i_X: X->U(hat(X)))$.

Now, given such a functor $U$, we can define the aforementioned $F$, which we will call the left-adjoint of $U$.

We define $F_obj: X |-> hat(X)$.

#notebox[
  Observe that for $c in obj(cat(C)), d in obj(cat(D))$, every morphism from $c$ to $U(d)$ uniquely defines a morphism from $hat(c)$ to $d$ (by virtue of $(hat(c),i_c)$ being an universal morphism from $c$ to $U$). In the inverse direction, every morphism $f$ from $hat(c)$ to $d$ produces a map from $c$ to $U(d)$, namely $U(f) compose i_c$. Therefore, we have $ Hom_C (c, U(d)) isom Hom_D (F(c),d) $

  _This_ is why $F$ is called the _left_-adjoint of $U$.

  The name "adjoint" is probably inspired by the equation $ inprod(x,T y)=inprod(T^* x,y), $ where $T^*$ is the complex conjugate of $T$, also known as the _adjoint_ of $T$.
]

Given any $f in Hom_C (X,Y)$, we use the bijection $Hom_C (X,U(F(Y))) isom Hom_D (F(X),F(Y))$ on $i_Y compose f$ to produce a map from $F(X)$ to $F(Y)$. We define this map to be $F_"mor" (f)$.

Therefore, $F (f)$ is the unique morphism which makes the following square commute: 
#align(center, commutative-diagram(node-padding:(30pt,30pt),
  node((0, 0), [$X$]),
  node((0, 2), [$Y$]),
  node((2, 0), [$U(F(X))$]),
  node((2, 2), [$U(F(Y))$]),
  arr((0, 0), (2, 0), [$i_X$]),
  arr((0, 2), (2, 2), [$i_Y$]),
  arr((0, 0), (0, 2), [$f$]),
  arr((2, 0), (2, 2), [$U(F(f))$], label-pos: right),
))

This shows that there is a natural transformation from $id_C$ to $U compose F$, with ${i_A}_(A in C)$ as its components. This natural transformation is known as the "unit". #try : Relate with #link("https://en.wikipedia.org/wiki/Adjoint_functors#Definition_via_counit%E2%80%93unit")[unit-counit definition].

#div

Observe that the morphism-map for $F$ just fell out naturally after we had the fact that $ Hom_D (F(c),d) isom Hom_C (c, U(d)) $

We can also recover $i_X$ from this isomorphism by pulling $id_F(X)$ through the isomorphism.

What happens if we start just with the isomorphism as our only assumption? But what kind of isomorphism do we want between $Hom_D (F(c),d)$ and $Hom_C (c, U(d))$?

Suppose we have set bijections $phi_(c,d):Hom_D (F(c),d) -> Hom_C (c, U(d))$. For them to behave nicely with the categories $C$ and $D$ (with respect to composition), we should have that the following squares commute : 

#columns(2)[

#align(center, commutative-diagram(node-padding:(30pt,30pt),
  node((0, 0), [$Hom_D (F(c),d)$]),
  node((0, 2), [$Hom_C (c,U(d))$]),
  node((2, 0), [$Hom_D (F(c),d')$]),
  node((2, 2), [$Hom_C (c,U(d'))$]),
  arr((0, 0), (2, 0), [$g compose -$]),
  arr((0, 2), (2, 2), [$U(g) compose -$]),
  arr((0, 0), (0, 2), [$phi_(c,d)$], "bij"),
  arr((2, 0), (2, 2), [$phi_(c,d')$], label-pos: right, "bij"),
))

#colbreak()

#align(center, commutative-diagram(node-padding:(30pt,30pt),
  node((0, 0), [$Hom_D (F(c),d)$]),
  node((0, 2), [$Hom_C (c,U(d))$]),
  node((2, 0), [$Hom_D (F(c'),d)$]),
  node((2, 2), [$Hom_C (c',U(d))$]),
  arr((0, 0), (2, 0), [$- compose F(h)$]),
  arr((0, 2), (2, 2), [$- compose h$]),
  arr((0, 0), (0, 2), [$phi_(c,d)$], "bij"),
  arr((2, 0), (2, 2), [$phi_(c',d)$], label-pos: right, "bij"),
))

]

where $g in Hom_D (d,d')$ and $h in Hom_C (c',c)$. Note that the $phi$ arrows are bidirectional.

#notebox[
  To motivate the forward-$phi$ direction of the first commutative square, draw out categories $C$ and $D$ with the objects $c,U(d),U(d')$ and $F(c),d,d'$ respectively.

  Now take $f in Hom_D (F(c),d), g in Hom_D (d,d')$. Observe that we need (for "aesthetic" reasons) $ phi_(c,d')(g compose f)=U(g) compose phi_(c,d) (f), $ which is precisely what the square claims.

  Similarly, handle the motivation of the backward-$phi$ direction of the first square and both $phi$ directions of the second square.
]

They correspond respectively to $Hom_D (F(c),-), Hom_C (c,U(-)):D->cat("Set")$ being naturally isomorphic and $Hom_D (F(-),d),Hom(-,U(d)):C^"op"->cat("Set")$ being naturally isomorphic.

Putting those two together, we get that the two bifunctors $Hom_D (F(-),-),Hom_C (-,U(-)):C^"op" times D-> cat("Set")$ should be naturally isomorphic.

#notebox[
  Therefore, we finally get that $F:C->D$ and $U:D->C$ are called adjoints of each other iff $ Hom_D (F(-),-), Hom_C (-,U(-)):C^"op" times D->cat("Set") $ are naturally isomorphic functors.

  Rephrasing, functors $F:C->D$ and $U:D->C$ are called adjoints of each other iff the isomorphism $ Hom_D (F(c),d)isom Hom_C (c,U(d)) $ is natural in the arguments $c$ and $d$.
]

#notebox[
  Observe that the key part was $ forall c,d , Hom_D (F(-),-)isom Hom_C (-,U(-)) "as sets". $

  The isomorphism being natural in $c$ and $d$ is merely book-keeping to make sure that the set theoretic isomorphism plays well along with the composition in the groups $C$ and $D$.

  This might be a recurring theme about naturality, in the sense that it tries to make sure that the basic structure of categories is being preserved. I also feel like whenever naturality is used somewhere in a definition, it is just there to make sure that the structure is being maintained, while the real action takes part somewhere else in the definition; but I am not sure about this. 
]

#div

The idea of using $Hom_D (F(c),d) isom Hom_C (c,U(d))$ fits in nicely with

- The product bifunctor is the right adjoint of the diagonal functor: #h(30%) $ Hom_cat("Set" times "Set")(inprod(C,C),inprod(A,B)) isom Hom_cat("Set") (C,A times B) $
- The coproduct bifunctor  is the left adjoint of the diagonal functor: $ Hom_cat("Set")(A union.sq B,C)isom Hom_cat("Set" times "Set")(inprod(A,B),inprod(C,C)) $ 
- Ceiling is the left adjoint of the inclusion functor $i:ZZ->RR$ (considering posetal categories $ZZ$ and $RR$): $ Hom_ZZ (ceil(a),b) isom Hom_RR (a,i(b)) $ 
- Floor is the right adjoint of the inclusion functor $i:ZZ->RR$ (considering posetal categories $ZZ$ and $RR$): $ Hom_RR (i(a),b)isom Hom_ZZ (a,floor(b)) $
- Free group construction is the left adjoint of the forgetful functor from #cat[Grp] to #cat[Set]: $ Hom_cat("Grp")("Free"(X),G)isom Hom_cat("Set") (X, "Forget"(G)) $
- $(- times S)$ is the left adjoint of $Hom(S,-)$: $ "Hom"_cat("Set")(A times S,B)isom Hom_cat("Set")(A, Hom(S,B)) $
- $G|->G^"ab"=G\/[G,G]$ is the left adjoint of the inclusion functor $i : cat("Ab")->cat("Grp")$: $ Hom_cat("Ab")(G\/[G,G],H)isom Hom_cat("Grp") (G,i(H)) $

Therefore, observing a "simple" isomorphism between $Hom_D (F(c),d)$ and $Hom_C (c,U(d))$ is often a key step to identifying that adjoints are at play.

#div

#notebox[
  #try : Work left to do:

  - What is this feeling/intuition of the left adjoint being "liberal", and the right adjoint being "conservative"? See the comment #link("https://mathoverflow.net/questions/6551/what-is-an-intuitive-view-of-adjoints-version-1-category-theory#comment740420_51659")[here].
  - What is the intuition behind adjoints being the "formulaic solution to an optimization problem"? See #link("https://mathoverflow.net/a/6555")[this] MO answer.
  - The MO answer linked above also says that 
    #indent[_"The notion that $F$ is the most efficient solution to the (optimization) problem posed by $G$ is, in a certain rigorous sense, equivalent to the notion that $G$ poses the most difficult problem which $F$ solves."_]
    This might explain the "liberal"/"conservative" intuition described above.
]

#div

References:

- https://en.wikipedia.org/wiki/Adjoint_functors
- _Categories for the Working Mathematician_, Mac Lane: Introduction, "Adjoints" chapter
- https://mathoverflow.net/q/6551
- https://math.stackexchange.com/q/25455
- https://ncatlab.org/nlab/show/adjoint+functor
