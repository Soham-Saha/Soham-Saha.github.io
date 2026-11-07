#import "../math_template.typ" : *

#show : start.with(
  title   : [Differential forms],
  author  : "Soham Saha"
)

#notebox[
  Wikipedia #link("https://en.wikipedia.org/wiki/Differential_form#")[says] that #indent[
    Differential forms provide a unified approach to define integrands over curves, surfaces, volumes, and higher-dimensional manifolds.
  ]

  Let us try to figure out why that might be so.
]

#ibox[Q.][
  Given an open subset $U subset.eq RR^n$ and $1<=k<=n$, what "structure" $X_(U,k)$ can I have on $U$ such that for _every_ $k$-manifold $M$ inside $U$, there is a "nice" notion of taking "integral of $X_(U,k)$" over $M$?
]

#ibox[A.][
  Suppose that to every point $p in U$, we have assigned a function $phi_p$ which takes in $k$-parallelepipeds, and converts them into real numbers.
  
  Now, given any $k$-manifold $M$, we can split it into many infinitesimal pieces which look like $k$-parallelepipeds, and then $phi_p$ will tell us what value to assign to each parallelepiped. Finally, we take the sum over all of these values to compute the "integral" over $M$.

  Note that we need $phi_p$ to be "coherent" in assigning values to the $k$-parallelepipeds, for example, if I scale a parallelepiped $A$ by $2$ to get $A'$, then $phi_p (A')$ should equal $2 phi_p (A)$. This is so that the "integral" doesn't depend on which particular infinitesimal splitting of $M$ we take.

  This matches with the intuition we have developed in the section *Building intuition about exterior powers*. We want to have each $phi_p in Lm^k (RR^n)^*$.

  This "structure" that we have developed, is called a *differential $k$-form over $U$*.
]

#divdash

Given an open subset $U subset.eq RR^n$, a *differential $k$-form over $U$* is a function $omega$ of type $ omega:: (p:U)->(Lm^k T_p (U))^* isom Lm^k T_p^* (U) $

#notebox[
  - We shall write "$k$-form" as short-hand for "differential $k$-form".
  
  - Observe that $0$-forms correspond to $C^oo$-functions on $U$.

  - Just to summarize the intuition we have developed above, #rect(width:100%)[
    Defining a $k$-form on open subset $U subset.eq R^n$ is the same as assigning to each point in $U$ its own "coherent" way of "measuring" $k$-parallelepipeds based at $p$.
  ]
]

#divdash

Observe that every $1$-form assigns linear functionals to every point $p in U$.

When we take a derivative of a $C^oo$ function at a point in its domain, we get a linear functional.

Putting together the above two ideas, for every function $f in C^oo (U)$, we can define a $1$-form $d f$ as $ &&d f &= D f\ "i.e.",&& (d f)_p &= D f (p)\ "i.e.",&& (d f)_p &=[v in T_p (U)|->D_v f(p)=D f (p)(v)] $

We have a basis ${e_1,...,e_n}$ for $T_p (U) isom RR^n$. Observe that $ (d x^i)_p (e_j)=D_j (x^i)(p)=(del x^i)/(del x_j)=delta_(i j) $

Therefore, ${(d x^i)_p}$ is a basis for $T_p^* (U)$, and this basis is dual to ${e_1,...,e_n}$, which is a basis for $T_p (U)$.

Note that here $x^i$ is the "extract coordinate along $e_i$" function.

#notebox[
  The $1$-form $d x$ over $RR^3$ assigns to each point $p in RR^3$ the $1$-volume-measuring-function given by #indent[For every $1$-parallelepiped (i.e., a single vector) based at $p$, project it onto the $X$-axis, and check the extent of the shadow.]

  The $2$-form $d x and d y :: (p:RR^3)->Lm^2 (T_p ^* (RR^3))$ assigns to each point $p in RR^3$ the $2$-volume-measuring-function given by #indent[
    For every $2$-parallelepiped based at $p$ (i.e., a parallelogram, an element of $Lm^2 T_p (RR^3)$), calculate the (signed) area of its shadow on the $X Y$-plane.
  ]

  Given $f,g,h in C^oo (RR^3)$, the $2$-form $f dot d x and d y+g dot d y and d z+h dot d x and d z$ assigns to each point $p in RR^3$ the $2$-volume-measuring-function given by #indent[
    For every $2$-parallelepiped based at $p$, calculate $ f(p)dot ("signed area of shadow on XY-plane")+\ g(p)dot ("signed area of shadow on YZ-plane")+ \ h(p) dot ("signed area of shadow on XZ-plane")  $
  ]

  Note that when we say "signed area of shadow on `XY`-plane", we refer to the "oriented" `XY`-plane. So, "signed area of shadow on `YX`-plane" will be $(-1) dot$ "signed area of shadow on `XY`-plane".
]

#divdash