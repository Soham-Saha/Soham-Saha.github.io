#import "../math_template.typ" : *

#show : start.with(
  title   : "Tangent spaces and derivations",
  author  : "Soham Saha"
)

#notebox[
  We will be ${x^1,...,x^n}$ to describe the standard basis of $RR^n$.

  Using standard abuse of notation, we will also be using $x^i$ to denote the projection map from $RR^n->RR$ that extracts the $i^"th"$ coordinate of a given vector.

  #divdash

  While initially we will try to maintain generality by giving definitions over manifolds, eventually, we will transition to the specific case of open sets in $RR^n$.
]

#divdash

A topological space $M$ is an *$n$-dimensional manifold*  iff for every $p in M$, there is a neighborhood around $p$ which is homeomorphic to some open subset of $RR^n$.

A *_smooth_ manifold* is one where we have "diffeomorphic" instead of "homeomorphic".

For every $p$, the homeomorphism/diffeomorphism $phi:U_p->^~U$ from the neighborhood $U_p subset.eq M$ of $p$ to some open subset $U subset.eq RR^n$ is know as a "*chart*".

#notebox[
  We will be mostly interested in the case when open subsets of $RR^n$ interpreted as $n$-manifolds.
]

#divdash

Given a smooth $n$-manifold $M$, and a point $p in M$, consider the following set $ S_p={(I,gamma:I-->^"smooth"M):I "is an open interval in" RR "containing" 0 "s.t." gamma(0)=p} $

So, $S_p$ is the set of smooth curves from some open interval in $RR$ to $M$ "based at" $p$.

Informally speaking, two smooth curves $(I_1,gamma_1),(I_2,gamma_2) in S_p$ will be considered "equivalent" iff they have the same velocity vector at $p$. #indent[
  To make the above definition formal, first observe that there is a diffeomorphic chart $phi:U_p->U$, where $U_p$ is a neighborhood of $p$, and $U$ is an open subset in $RR^n$.

  We define an equivalence relation $~$ on $S_p$ as $ (I_1,gamma_1)~(I_2,gamma_2) <=> D(phi compose gamma_1)(0) = D(phi compose gamma_2)(0) $
]

Finally, we define the *tangent space to $M$ at $p in M$* as $ T_p (M):=S_p\/~. $

Intuitively speaking, $T_p (M)$ stores all possible velocity vectors of smooth curves passing through $p$.

#notebox[
  Equivalently, we can think of members of $T_p (M)$ as the velocity vectors themselves, storing $D(phi compose gamma)(0)$ instead of $[(I,gamma)]$.

  But we will soon see that the equivalence class definition is nicer in some circumstances.
]

#notebox[
  $[(I,gamma)]|->D(phi compose gamma)(0)$ establishes a bijection between $T_p (M)$ and $RR^n$. Observe that this bijection is chart dependent.

  The vector space structure on $RR^n$ can be pulled back to establish a vector space structure on $T_p (M)$. So, we get the following vector space isomorphism, for $n$-dimensional smooth manifolds $M$, $ T_p (M) isom RR^n $

  #div

  For the particular case of open subset $U$ or $RR^n$, we get $T_p (U) isom RR^n isom T_p (RR^n)$.
]

#divdash

Given $f in C^oo (M)$ (i.e., $f$ is a $C^oo$ map from $M$ to $RR$) and $v in T_p (M)$ (where $v$ is of the form $[(I,gamma)]$), define the "*directional derivative of $f$ along $v$*" as $ D_v (f):=D(f compose gamma)(0). $

#notebox[
  When $M=U subset.eq^"open" RR^n$, we can apply chain rule to get $ D_v (f)=D (f compose gamma)(0)=D f (gamma(0)) times gamma'(0)=D f(p) times gamma'(0) $

  Thinking of $T_p (M)$ as $RR^n$, $gamma'(0)$ is the data that $v$ carries. We also have that $ D f (p)=mat(D_1 f (p),..., D_n f(p))=mat((del f)/(del x^1)(p), ..., (del f)/(del x^n)(p)) $

  Therefore, $D_v (f)$ is simply dot product of $v$ with $[D_i f (p)]^T$.
]

#divdash

Observe that $D_v$ is an $RR$-linear map from $C^oo (M)$ to $RR$ which satisfies the *Leibniz property (at $p$)*, $ forall f ,g in C^oo (M),D_v (f g)=f(p)D_v (g)+D_v (f) g(p) $

In general, given a smooth $n$-manifold $M$, and a point $p in M$, any $RR$-linear map from $C^oo (M)$ to $RR$ which satisfies the Leibniz property at $p$ is called a *point derivation at $p$*.

#let Der = $"Der"$

The set of point derivations at $p$ is denoted as $Der_p (C^oo (M),RR)$.

#notebox[
  Point derivations, as defined above, are intended to capture the essence of "taking the directional derivative at a point". The key idea is that the Leibniz rule is all we care about it anyway.

  In fact, as we will soon see, all point derivations at $p$ are "essentially" the same as taking the directional derivative at $p$ along some vector.
]

#divdash

Given a topological space $X$, a set $Y$, and functions $f,g:X->Y$, $f$ and $g$ *define the same germ* at $x in X$ if there is some open neighborhood around $x$ where $f$ and $g$ agree.

_Defining the same germ_ is an equivalence relation on functions of type $X->Y$.

#divdash

Given an open set $U subset.eq RR^n$ and a point $p in U$, consider the set $ T_(p,U) ={(V,f):V "open in" RR^n, p in V subset.eq U, f in C^oo (V)}. $

Define the following equivalence relation on $T_U$, $ (V,f) approx (W,g) <=> f|_(V inter W) "and" g|_(V inter W) "define the same germ at" p. $

Define $C^oo_(p, U)$ as $ C^oo_(p,U):=T_(p,U)\/approx. $

$C_(p,U)^oo$ forms a vector space over $RR$.

#notebox[
  So, each elements of $C_(p,U)^oo$ contains data about how a $C^oo$--function can "locally" behave around $p in U$.
]

We define point derivations on $C^oo_(p,U)$ as $RR$-linear maps from $C_(p,U)^oo$ to $RR$ which satisfy the Leibniz rule at $p$; i.e., a derivation $Delta in Hom_RR (C_(p,U)^oo,RR)$ satisfies $ forall f,g in C_(p,U)^oo,Delta (f g)=f_0(p)Delta (g)+Delta (f)g_0(p), \ "where" f=[(V,f_0)],g=[(W,g_0)],f g:=[f|_(V inter W) times g|_(V inter W)] $

The set of *point derivations on $C_(p,U)^oo$ at $p$* is denoted as $Der_p (C^oo_(p,U),RR)$.

#notebox[
  In our lectures, $Der_p (C^oo_(p,U),RR)$ is denoted as $cal(D)(C^oo_p)$.

  #div

  As we mentioned above, each elements in $Der_p (C^oo (U),RR)$ is supposed to represent the action of taking directional derivative of an arbitrary function at $p$ along some vector.

  To extend that analogy, each element in $cal(D)(C_p^oo)$ represents taking in the "local behavior at $p$" of an arbitrary $C^oo$-function, and then taking its directional derivative along some vector.
  
  #div
  
  It turns out that $ Der_p (C^oo (U),RR) isom Der_p (C^oo_(p,U),RR). $

  #try : Get into details.

  *We will not be dealing with this at all.* Handling germs of functions is algebraically nicer if we want to analyze local behavior, so the natural thing to do here is to work in $Der_p (C_(p,U)^oo,RR)$.
]

#divdash

#notebox[
  This part formalizes that all point derivations at $p$ are actually equal to $D_v$ for some vector $v$, where $D_v$ represents the taking the directional derivative at $p$ along $v$.
]

Given an open set $U subset.eq RR^n$, and a point $p in U$, we would like to characterize derivations $Delta in Der_p (C^oo_(p,U),RR)$.

Fortunately for us, it turns out that all point derivations are actually equal to $D_v$ for some $v in T_p (U)$.

In fact, $ Phi&:T_p (U)->Der_p (C_(p,U)^oo, RR)\ Phi &:=v |-> D_v $ is an isomorphism in $RR$-Vect, and $Phi^(-1)$ is given by $ Phi^(-1)&:Der_p (C_(p,U)^oo,RR)->RR^n isom T_p (U)\ Phi^(-1)&:=Delta|->mat(Delta (overline(x^1)), ..., Delta (overline(x^n)))^T, $ where $overline(x^i)$ is shorthand for $[(U,x^i|_U)]$, where $x^i:RR^n->RR$ is the projection map onto the $i^"th"$ basis vector.

#notebox[
  Recall the isomorphism between $T_p (U)$ and $RR^n$, $[(I,gamma)]|->gamma'(0)$.
  
  Observe that for arbitrary $v in T_p (U)$, where $v=[(I,gamma)]$, we have $ Phi^(-1)(Phi(v))&=Phi^(-1)(D_v)\ &=mat(D_v (overline(x^i)))_(1<=i<=n)^T\ &=mat(D_v (x^i))_(1<=i<=n)^T\ &= [D (x^i compose gamma)(0)]_(1<=i<=n)^T\ &=[D_i (gamma)(0)]_(1<=i<=n)^T\ &= gamma'(0), $ and under the isomorphism $RR^n isom T_p (U)$, this becomes $[(I,gamma)]=v$. Therefore, $Phi^(-1) compose Phi =id$.

  Now, given an arbitrary point derivation $Delta in Der_p (C_(p,U)^oo,RR)$, we have $ Phi (Phi^(-1)(Delta))&=Phi(mat(Delta (overline(x^1)), ..., Delta (overline(x^n)))^T)\ &=D_v, "where" v=mat(Delta (overline(x^1)), ..., Delta (overline(x^n)))^T $

  We want to show that for this choice of $v$, $D_v =Delta$.

  We have previously shown that $D_v (f)=lr(chevron.l v,[D_i (f)(p)]^T chevron.r)$, where the inner product is dot product.

  So here, for some arbitrary $f in C^oo_(p,U)$, we have $ Phi(Phi^(-1)(Delta))(f)&=D_v (f)\ &=sum_(i=1)^n Delta(overline(x^i)) dot D_i (f)(p) $

  #try : See 22nd Oct board pics, almost done, just do the Taylor expansion.
]

\

So, we get that $cal(D)(C_p^oo)$ (which is just shorthand for $Der_p (C^oo_(p,U),RR)$) is exactly the same as ${D_v : v in T_p (U)}$.

If we think of $T_p (U)$ as being isomorphic to $RR^n$, then we get the basis ${D_x_i}_(1<=i<=n)$ for $cal(D)(C_p^oo)$. Here ${x_i}_(1<=i<=n)$ is the standard basis of $RR^n$.

#notebox[
  For example, for $U subset.eq^"open" RR^3$, we take the basis ${e_1,e_2,e_3}$ for $RR^3 isom T_p (U)$, which gives us the basis $ {D_e_1=lr(del/(del x)|)_p ,D_e_2=lr(del/(del y)|)_p,D_e_3=lr(del/(del z)|)_p} $ for $cal(D)(C_p^oo)$.
]

\

#notebox[
  Therefore we have a $3$-way isomorphism so far, $ T_p (U) isom RR^n isom cal(D)(C_p^oo), $ given by $ v in RR^n &|-> cases((t in [-epsilon,epsilon]|->p+ v t) in T_p (U), ("directional derivative along" v) in cal(D)(C_p^oo))\ gamma in T_p (U)&|->cases(phi'(0) in RR^n, (f|->D(f compose gamma)(0)) in cal(D)(C^oo_p))\ Delta in cal(D)(C^oo_p)&|->cases(mat(Delta(overline(x^1)),...,Delta(overline(x^n)))^T in RR^n, "just use above" RR^n->T_p (U) "map") $
]

