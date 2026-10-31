#import "../math_template.typ" : *

#show : start.with(
  title   : [Applications of the structure theorem\ for finitely generated modules over PIDs],
  author  : "Soham Saha"
)

#let End = $"End"$
#let Ab = $"Ab"$

Consider a field $F$ and a $F[x]$-module structure over an Abelian group $A$. What data does this module carry?

#indent[
  It carries the data of a ring homomorphism from $F[x]$ to $End_Ab (A)$; which is a ring homomorphism from $phi:F->End_Ab (A)$ and a target for $x$ to go to. But $x$ can't be sent anywhere ($End_Ab (A)$ is not a commutative ring), it has to go some $L in End_Ab (A)$ such that $forall r in F, phi(r) compose L=L compose phi(r)$.

  Now observe that $phi$ just carries the data of $A$ being a vector space over $F$. So $phi(r)$ refers to "multiplication by the scalar $r$". We notice that "$phi(r)$ and $L$ commute for all $r$" is equivalent to saying that $L$ is a linear operator on the vector space $A$.

  So, a $F[x]$ module carries the data of a vector space over $F$ and a linear operator over that vector space. 
]

Going in the reverse direction, any linear operator on a finite dimensional vector space (over a field $F$) can be packaged into a finitely generated $F[x]$-module.

Now consider $ZZ$-modules, that is, Abelian groups. Finitely generated Abelian groups are finitely generated modules over $ZZ$.

Note that $F[x]$ and $ZZ$ are both PIDs. So, if we can get a structure theorem for finitely generated modules over PIDs, we can potentially say interesting stuff about linear maps over vector spaces and finitely generated Abelian groups, therefore hitting two birds with one stone!

#divdash

#notebox[
  We will be using the following fact without proving it:

  #indent[
    If $R$ is Noetherian, then any finitely generated $R$-module is also Noetherian.
  ]

  This is *equivalent* to $14.6.5$ of Artin, which states that #indent[
    If $R$ is a Noetherian ring, then every submodule of a finitely generated $R$-module is finitely generated.
  ]

  For the proof of the above statement, check Artin.
]

Given a PID $R$, consider $M$, a finitely generated $R$-module. By virtue of it being finitely generated, there is a surjective morphism $phi in Hom_R (R^n,M)$ for some $n < oo$. $R^n$ is a finitely generated $R$-module over a PID, and therefore Noetherian. So $ker(phi)$, which is a sub-module of $R^k$ is also finitely generated. So, there is a surjective morphism $psi in Hom_R (R^m,ker(phi))$ for some $m<oo$. Therefore, we have this chain of morphisms in $R$-Mod, $ R^m ->>^psi ker(phi) arrow.hook^i R^n ->>^phi M, $ which leads us to $ M isom R^n/ker(phi) isom R^n/(im(i compose psi)) = "coker"(i compose psi). $

Observe that $i compose psi$ is an $R$-linear map from $R^m$ to $R^n$ (i.e., $i compose psi in Hom_R (R^m,R^n)$).

Also observe that given $gamma in Hom_R (R^m, R^n)$, $"coker"(gamma)=R^n\/im(gamma)$ is a finitely generated $R$-module.

Therefore, any finitely generated module over a PID $R$, is isomorphic to the cokernel of a $R$-linear map $phi in Hom_R (R^m,R^n)$, for some $m, n in ZZ_(>=0)$.

#divdash

#notebox[
  - Every invertible  matrix over an Euclidean domain can be written as a product of elementary row/column operation matrices.
  - However, *the above statement is false for PIDs*. We can have invertible matrices over PIDs which cannot be written as product of elementary matrices.
]

Observe that $phi$, being a $R$-linear map from $R^m$ to $R^n$, is uniquely characterized by the $n times m$ matrix $A=mat(phi(e_1),...,phi(e_m))$.

Now comes the interesting part:

#indent[
  If $R$ was an Euclidean domain, then we can reduce $A$ to the #link("https://en.wikipedia.org/wiki/Smith_normal_form")[Smith normal form], using only elementary row and column operations (see Artin $14.4$). This produces invertible matrices $Q$ and $P$ such that $Q^(-1)A P$ is in Smith normal form.

  However, if $R$ is just  given to be a PID, then while we #link("https://en.wikipedia.org/wiki/Smith_normal_form#Algorithm")[are guaranteed to find] invertible matrices $Q,P$ such that $Q^(-1)A P$ is in Smith normal form, there is #link("https://mathoverflow.net/a/277068")[*no guarantee* that $Q$ and $P$ can be expressed as product of elementary matrices].
]

So even in the general case where $R$ is a PID, we can find matrices invertible $Q$ and $P$ such that $Q^(-1)A P$ is in Smith normal form.

Invertible matrice merely change the basis in the domain and codomain. Therefore we can assume WLOG that the matrix of $phi$ was already in the Smith normal form.

Therefore $im(phi)$ looks like ${(a_1d_1,...,a_k d_k,0,...,0) in R^n : d_1,...,d_k in R}=(a_1) times ... times (a_k) times (0)^(n-k)$ for some $a_1,...,a_k in R$ attained from the Smith normal form such that $a_1 divides a_2 divides ... divides a_k$.

Therefore, $M isom "coker"(phi)=R^n\/im(phi) isom [product_(i=1)^k R\/(a_i)] times R^(n-k)$ where $a_1 divides a_2 divides ... divides a_k$.

This is known as the structure theorem for finitely generated modules over a PID.

#divdash

Applying the above result to finitely generated $ZZ$-modules, (i.e., finitely generated Abelian groups)  immediately gives us the structure theorem for finitely generated Abelian groups.

#try : Observe what happens for the $F[x]$ case. We should be getting the rational canonical form of the linear operator which is encoded as an $F[x]$-module; further assuming that $F$ is algebraically closed, we should be able to get to the Jordan canonical form. 