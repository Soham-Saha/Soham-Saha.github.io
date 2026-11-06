#import "../math_template.typ" : *

#show : start.with(
  title   : [Differential forms],
  author  : "Soham Saha"
)

#ibox[Q.][
  Given an open subset $U subset.eq RR^n$ and $k<=n$, what "structure" $X_(U,k)$ can I have on $U$ such that for _every_ $k$-manifold $M$ inside $U$, there is a "nice" notion of taking "integral of $X_(U,k)$" over $M$?
]

#ibox[A.][
  Suppose that to every point $p in U$, we have assigned a function $phi_p$ which takes in $k$-parallelepipeds, and converts them into real numbers.
  
  Now, given any $k$-manifold $M$, we can split it into many infinitesimal pieces which look like $k$-parallelepipeds, and then $phi_p$ will tell us what value to assign to each parallelepiped. Finally, we take the sum over all of these values to compute the integral over $M$.

  Note that we would prefer if $phi_p$ was "coherent" in assigning values to the $k$-parallelepipeds, for example, if I scale a parallelepiped $A$ to get $A'$, then $phi_p (A')$ should equal $2 phi_p (A)$.

  This matches with the intuition we have developed in the section *Building intuition about exterior powers*. We want to have each $phi_p in Lm^k (RR^n)^*$.

  This "structure" that we have developed, is called a *differential $k$-form over $U$*.
]

#divdash

Given an open subset $U subset.eq RR^n$, a *differential $k$-form over $U$* is a function $omega$ of type $ omega:: (p:U)->(Lm^k T_p (U))^* isom Lm^k T_p^* (U) $

#notebox[
  We shall write "$k$-form" as short-hand for "differential $k$-form".
]

#divdash