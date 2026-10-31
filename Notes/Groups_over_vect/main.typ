#import "../math_template.typ" : *

#show : start.with(
  title   : [Groups acting over vector spaces],
  author  : "Soham Saha"
)

#let tensor = math.times.o
#let Lm = math.Lambda

#notebox[
  We will be working over $cat("Vect")_k$ for some arbitrary field $k$ of characteristic $0$.

  #divdash
  
  Note that we will only be considering actions of #pnote[finite] groups.
]

Given a finite group $G$ acting on a $k$-Vector space $V$ by the action $ lm in Hom_cat("Grp")(G,"Aut"_(k"-Vect")(V)), $ we can define *$lm$-invariant maps* from $V->W$ as those $k$-linear maps which respect the action of $lm$; i.e., $ lm"-invar"(V,W) &subset.eq Hom_k (V,W)\ forall phi in Hom_k (V,W), phi in lm"-invar"(V,W) &<=> [forall v in V, forall g in G, phi(v)=phi(lm(g)(v))]\ &<=>[forall g in G, phi = phi compose lm(g)]. $

#notebox[
  When we refer to $lm$-invariant maps without first defining the action $lm$, $lm$ is supposed to be inferred from context.
  
  #divdash
  
  Now is a good time for some examples.

  - Consider the symmetry group $S_2={id,sigma}$ acting on $V tensor V$ by $sigma (v_1 tensor v_2)=v_2 tensor v_1$. The $lm$-invariant maps from $V tensor V$ to $W$ are just symmetric $k$-linear maps from $V tensor V$ to $W$, which are defined as symmetric bilinear maps from $V times V$ to $W$.
  
  - More generally, if we take the action of $S_n$ on $T^n (V)$ as $ sigma (v_1 tensor ... tensor v_n)=v_(sigma^(-1)(1)) tensor ... tensor v_(sigma^(-1)(n)), $ then we get symmetric multilinear maps.
  
  - If we instead consider $S_n$ acting on $T^n (V)$ by $ sigma (v_1 tensor ... tensor v_n)=pnote("sgn"(sigma)) dot v_(sigma^(-1)(1)) tensor ... tensor v_(sigma^(-1)(n)), $ then we get _alternating_ multilinear maps.
]

\

Now, we would be very happy if we could think of these $lm$-invariant maps $V$ to $W$ as just $k$-linear maps from some vector space to $W$. That is, we would like to have a vector space $X_(V,lm)$ such that there is a "natural" isomorphism between #tag($(*)$,$ lm"-invar"(V,W) isom Hom_k (X_(V,lm),W). $)

In fact, if $(V,W)|-> lm"-invar"(V,W)$ and $V |-> X_(V,lm)$ are functorial, then we can formalize naturality by saying that the isomorphism is natural in parameters $V$ and $W$. 

\

Define $V_lm$ as $ V_lm := V/("span"_k (union.big_(sigma in G){v -sigma (v):v in V}))= V/("span"_k ({v-w:v in V,w in "orb"_lm (v)})). $

The universal property of the quotient tells us that $V_lm$ satisfies the universal property described for $X_(V,lm)$ at $(*)$.

\

#notebox[
  Suppose we have a subspace $W subset.eq V$, and we would like to find a subspace of $V$ which is isomorphic to $V\/W$. If we can find an endomorphism $f in "End"_k (V)$, such that $ker(f)=W$, then we have, by the first isomorphism theorem, $ V/W = V/ker(f)isom im(f) subset.eq V $
]

Consider #link("https://mathworld.wolfram.com/ReynoldsOperator.html")[Reynold's operator] $f_lm in "End"_k (V)$, which is defined as $ forall v in V,f_lm (v) := 1/abs(G) sum_(sigma in G) sigma (v) $

Observe that $ker(f_lm)="span"_k ({v-w:v in V,w in "orb"_lm (v)})$, and therefore, we get that $ V_lm =V/ker(f_lm) isom im(f_lm) subset.eq V $

Let us call $im(f_lm)$ as $V^lm$. 

So, we have successfully identified $V_lm$, which is defined as a quotient space of $V$, with the subspace $V^lm subset.eq V$.

\

#notebox[
  Recall that a linear operator $phi in "End"_k (V)$ is called projection iff $phi compose phi=phi$.

  One of the nice things about projection maps is that $ im(phi)="fix"(phi), $ where $"fix"(phi)={v in V : v=phi(v)}$ is the set of fixed points of $V$ under $phi$.
]

Furthermore, $f_lm$ is a projection map, which gives us two nice characterizations of $V^lm$, $ V^lm&=im(f_lm)="fix"(f_lm)={v in V : "orb"_lm (v)={v}}={v in V:forall sigma in G, sigma(v)=v}\ V^lm&=im(f_lm)={1/abs(G) sum_(sigma in G) sigma (v) : v in V} $

\

#notebox[
  In the case of symmetric multilinear maps, the vectors in $T^n (V)^lm subset.eq T^n (V)$ are known as the symmetric tensors. $V_lm$ is denoted as $"Sym"_n (V)$.

  If $V$ has a basis ${v_1,...,v_d}$, then ${v_i_1 tensor ... tensor v_i_n : 1<=i_1<=...<=i_n<=d}$ is a basis for $V_lm$ (_not_ for the subspace $V^lm$) . So $ dim("Sym"_n (V))=binom(dim(V)+n-1,n). $
  
  #divdash

  In the alternating multilinear case, the vectors in $T^n (V)^lm$ are known as alternating tensors. $V_lm$ is denoted as $Lambda^n V$, and is known as the $n^"th"$ exterior product or the $n^"th"$ wedge product. $f_lm$ is denoted as $"Alt"^n$.
]