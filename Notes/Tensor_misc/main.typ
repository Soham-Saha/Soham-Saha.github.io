#import "../math_template.typ" : *

#show : start.with(
  title   : "Tensor product miscellany",
  author  : "Soham Saha"
)

#let tensor = math.times.o
#let Hom = $"Hom"$
#let sgn = $"sgn"$
#let Lm = $Lambda$

#notebox[
  We will be working over $cat("Vect")_k$ for arbitrary field $k$.

  #divdash

  Define $T^n (V)$ as $underbrace(V tensor ... tensor V,n)$.

  $T^0(V)$ is defined as $k$, the scalar field interpreted as a vector space over itself.

  #divdash

  If $V$ has basis ${u_1,...,u_d}$, then $T^n (V)$ has basis ${u_i_1 tensor ... tensor u_i_n : 1<=i_1,...,i_n<=d}$.
]

Show that $T^n (V^*)$ is canonically isomorphic to $(T^n (V))^*$, when $V$ is a #pnote[finite dimensional vector space].

#indent[
  Given $f_1,...,f_n in V^*$, we can define a multilinear map from $(V,...,V)$ to $k$ as $(v_1,...,v_n)|->prod f_i (v_i)$. We can compress the data of this multilinear map to a linear map from $T^n (V)$ to $k$. Therefore, for every $(f_1,...,f_n) in (V^*,...,V^*)$, we have an object in $(T^n (V))^*$. Furthermore, this is a multilinear map from $(V^*,...,V^*)$ to $(T^n (V))^*$. Finally, we can compress the data down to a linear map from $T^n (V^*)$ to $(T^n (V))^*$, which when written simply, is just $ (f_1 tensor ... tensor f_n)(v_1 tensor ... tensor v_n)=f_1 (v_1) times ... times f_n (v_n) $

  This map is injective, and since $V$ is given to be finite dimensional, so by comparing dimensions we get that $(T^n (V))^*$ and $T^n (V^*)$ are isomorphic.

  #notebox[
    If $V$ and $W$ are infinite dimensional, then there can be injective maps from $V$ to $W$ which are not surjective. Therefore, the above doesn't work when $V$ is infinite dimensional.
  ]

  #notebox[
    Wait, what about the map from $(T^n (V))^*$ to $T^n (V^*)$?

    #indent[
      I am yet to express this "canonically", in the sense that I haven't yet found a definition which doesn't rely on a basis for $V$. But, it is still canonical, formally speaking, because the choice of the basis doesn't change the function that we get; i.e., whatever basis you choose for $V$ in the following definition, the map $phi:T^n (V)^*->T^n (V^*)$ will be always same.

      \

      Choose a  basis ${e_i}_(1<=i<=d)$ for $V$, and take the dual basis ${e^i}_(1<=i<=d)$ for $V^*$. The map $phi:T^n (V)^*->T^n (V^*)$ is given by $ f|-> sum_(i_1,...,i_n=1)^d f(e_i_1 tensor ... tensor e_i_n) dot e^(i_1) tensor ... tensor e^(i_n) $

      The function $phi$ stays same for every choice of basis ${e_i}$.
    ]
  ]
]

Note that if $V$ is infinite dimensional, then $T^n (V^*) isom.not (T^n (V))^*$.

#divdash

Not all $w in T^n (V)$ are simple.

For example, $e_1 tensor e_2 +e_2 tensor e_1 in T^2 (RR^2)$ is non-simple.

#divdash

Show how to give a ring structure over $ T(V):= plus.o.big_(i>=0) T^i (V)  $

#indent[
  Given $u_1 tensor ... tensor u_m in T^m (V)$ and $v_1 tensor ... tensor v_n in T^n (V)$, we define the product in the ring to be $ (u_1 tensor ... tensor u_m) times (v_1 tensor ... tensor v_n)=u_1 tensor ... tensor u_m tensor v_1 tensor ... tensor v_n in T^(m+n)(V) $
]

#divdash

$T^n$ is functorial, $k$-linear maps from $V$ to $W$ extend easily to $k$-linear maps from $T^n (V)$ to $T^n (W)$.

#indent[
  Given a $k$-linear map $phi in Hom_k (V,W)$, we have a multilinear map from $(V,...,V)$ to $T^n (W)$ given by $(phi(v_1),...,phi(v_n))|->(v_1 tensor ... tensor v_n)$ (this is produced by composing the list $[phi,..., phi]$ with the multimorphism from $(W,...,W)$ to $T^n (W)$). This map then gives us a linear map from $T^n (V)$ to $T^n (W)$.

  Note that $T^0$ is also functorial, with object map $A |->(T^0 A = k)$ and morphism map $f in Hom(A,B)|->(T^0 f=id_k) in Hom(k,k)$.
]

#divdash