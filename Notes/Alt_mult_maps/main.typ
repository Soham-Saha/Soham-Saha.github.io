#import "../math_template.typ" : *

#show : start.with(
  title   : "Alternating multilinear maps and wedge product",
  author  : "Soham Saha"
)

#let tensor = math.times.o
#let sgn = $"sgn"$
#let Lm = math.Lambda

#notebox[
  We will be working over $cat("Vect")_k$ for some arbitrary field $k$ of characteristic $0$.

  #divdash

  We will be needing to make two choices while we set everything up. They have been marked in the notes as *#pnote[$1^"st"$ choice]* and *#pnote[$2^"nd"$ choice]*.
]

Using the machinery developed in the previous section about groups acting on vector spaces, we have that:

- Consider the action of $S_n$ on $T^n (V)$ by $ sigma (v_1 tensor... tensor v_n)=sgn(sigma)(v_(sigma^(-1)(1))tensor...tensor v_(sigma^(-1)(n))). $

  Then, linear maps from $T^n (V)$ to $W$ (i.e., multilinear maps from $(V,...,V)$ to $W$) are called "alternating" if they respect this action; i.e., $ phi in Hom_k (T^n (V),W) "is called alternating iff"\ forall v in T^n (V), forall sigma in S_n, phi(sigma(v))=phi(v). $ 

- Define the $n^"th"$ wedge product of $V$ as $ Lm^n (V):=(T^n (V))/("span"_k ({v-w:v in T^n (V),w in "orbit"(v)})) $

  $Lm^n (V)$ has the nice property that alternating multilinear maps from $(V,...,V)$ to $W$ are in one-to-one correspondence with linear maps from $Lm^n (V)$ to $W$. So, we have $ "AltMulti"(V,...,V;W) isom Hom_k (Lm^n (V),W) $

- We write $v_1 and ... and v_n in Lm^n (V)$ for the image of $v_1 tensor ... tensor v_n in T^n (V)$ under the quotient map.

- A vector in $T^n (V)$ is called an "alternating tensor" if it is stable under the action of $S_n$; i.e., it has a singleton orbit; i.e.,  $ forall sigma in S_n, sigma(v)=v. $ We shall denote the set of alternating tensors in $T^n (V)$ as $V_"alt"^n$.

- Consider the map $ "Alt"^n in "End"_k (T^n (V))\ forall v in T^n (V), "Alt"^n (v):=1/n! sum_(sigma in S_n) sigma(v). $ 

  Note that in the above definition, $sigma(v)=sigma(v_1 tensor ... tensor v_n)=sgn(sigma)times v_(sigma^(-1)(1)) tensor ... tensor v_(sigma^(-1)(n))$, since that is how $sigma$ acts on $v$.
  
  It is easy to show that $im("Alt"^n)=V_"alt"^n$.

  This gives us a characterization of how the alternating tensors _look_ like.

  #notebox[
    Our definition of $"Alt"^n$ boils down to $ v_1 tensor... tensor v_n |-> 1/n! sum_(sigma in S_n) sgn(sigma)(v_(sigma^(-1)(1)) tensor ... tensor v_(sigma^(-1)(n))) $

    Note that some authors define $"Alt"^n$ as $ v_1 tensor... tensor v_n |-> 1/n! sum_(sigma in S_n) sgn(sigma)(v_(sigma(1)) tensor ... tensor v_(sigma(n))), $ but don't worry, since we are  taking sum over the entirety of $S_n$, so $sigma$ and $sigma^(-1)$ come in pairs; and $sgn(sigma)=sgn(sigma^(-1))$. Both definitions are equivalent.
  ]

- $"Alt"^n$ is a projection operator on $T^n (V)$ (projecting onto $V_"alt"^n$), and we have $ ker("Alt"^n)="span"_k ({v-w:v in T^n (V),w in "orbit"(v)}). $ Therefore, $ Lm^n (V)=(T^n (V))/ker("Alt"^n) isom im("Alt"^n)=V_"alt"^n, $ using the first isomorphism theorem.

  \

  Explicitly writing the isomorphism out, we have $ ([v]|->"Alt"^n (v)=1/n! sum_(sigma in S_n) sigma (v))&:Lm^n (V)-> V_"alt"^n\ (v |->[v])&:V_"alt"^n->Lm^n (V) $

  Again, note that $sigma(v)=sigma(v_1 tensor ... tensor v_n)=sgn(sigma)times v_(sigma^(-1)(1)) tensor ... tensor v_(sigma^(-1)(n))$, since that is how $sigma$ acts on $v$.

  #notebox[
    I believe that Spivak does *not* use this isomorphism, and instead, chooses $ [v]&|-> n! "Alt"^n (v)\ v &|-> 1/n![v] $

    Details about why this might be so are described below when we try to define the product on $ldsum_(n>=0) V_"alt"^n$.

    #divdash
  
    This is the #pnote[*$1^"st"$ choice*] we have to make. Choosing the isomorphism $[v] |-> "Alt"^n (v)$ leads to the wedge product becoming $ v in V_"alt"^k, w in V_"alt"^l\ v and w := "Alt"^(k+l) (v tensor w) in V_"alt"^(k+l), $ while choosing the isomorphism $[v] |-> n! "Alt"^n (v)$ leads  to the wedge product becoming $ v in V_"alt"^k, w in V_"alt"^l\ v and w := binom(k+l,l) "Alt"^(k+l) (v tensor w) in V_"alt"^(k+l) $

    Note that the *#pnote[$1^"st"$ choice]* does _not_ affect the multiplication on $ldsum_(n>=0) Lm^n (V)$, it only affects the multiplication on $ldsum_(n>=0) V_"alt"^n$.

    I shall leave this choice undetermined for now, since I am not very sure which side I want to commit to. If I ever need to use either the isomorphism between $Lm^n (V)$ and $V_"alt"^n$ or the product on $ldsum_(n>=0) V_"alt"^n$, I will update this part to decide which choice I shall use.
  ]

#divdash

Suppose $V$ is a finite dimensional vector  space with $dim(V)=d$.

If $n>d$, then the subspace we are quotienting by in the expression for $Lm^n (V)$ is the entire space $T^n (V)$, and therefore $dim (Lambda^n V)=0$.

If $n<=d$, and $V$ has a basis ${v_1,...,v_d}$, then ${v_i_1 and ... and v_i_n :1<=i_1 <i_2 <...<i_n<=d}$ is a basis for $Lm^n (V)$. So, $ n<=d => dim(Lambda^n (V))=binom(dim(V),n). $

Particularly, $Lambda^(dim (V))(V)$ is isomorphic to the scalar field $k$.

#divdash

Often we are interested in multilinear maps from $(V,...,V)$ back to the base field $k$. This corresponds to $ Hom_k (Lm^n (V),k) = (Lm^n (V))^* $

Recall that, if $V$ is a #pnote[finite dimensional] vector space, then we have $ T^n (V^*) isom (T^n (V))^* $

The quotient map $pi_1:T^n (V)->>Lm^n (V)$ is a surjection, which induces an inclusion $pi_1^*:Lm^n (V)^* arrow.hook T^n (V)^*$, and $(T^n (V))^* isom T^n (V^*)$, which gives us the inclusion $ Lm^n (V)^* arrow.hook T^n (V^*) $

#divdash

Again, assume $V$ is #pnote[finite dimensional].

Observe the following chain of morphisms: $ Lm^n (V)^* arrow.hook^(pi_1^*) T^n (V)^* arrow^i T^n (V^*) ->>^(pi_2) Lm^n (V^*), $ where $i:T^n (V)^*->^~T^n (V^*)$ is from the canonical isomorphism $T^n (V)^* isom T^n (V^*)$ (described above in *Tensor product miscellany*).

#notebox[
  This chain of morphisms composes to the following map from $Lm^n (V)^*$ to $Lm^n (V^*)$: $ f|-> sum_(1 <=i_1<...<i_n<=d) n! f(e_i_1 and ... and e_i_n) dot (e^(i_1) and ... and e^(i_n))=sum_(abs(I)=n) n! f(e_I)e^I, $ where ${e_i}_(1<=i<=d)$ is a basis for $V$ and ${e^i}_(1<=i<=d)$ is the dual basis.

  It turns out that the above is indeed an isomorphism, and the inverse of this isomorphism is $ [f_1 and ... and f_n |-> [u_1 and ... and u_n |-> 1/n! det[f_i (u_j)]]]:Lm^n (V^*)->^~ Lm^n (V)^* $

  Using this pair of isomorphisms is known as the *$"Alt"$ convention*.

  #div

  Instead of keeping around the annoying $1/n! det[-]$, we can instead choose a different isomorphism between $Lm^n (V)^*$ and $Lm^n (V^*)$ $ f &|-> sum_(abs(I)=n) f(e_I)e^I\ f_1 and ... and f_n &|-> [u_1 and ... and u_n |-> det[f_i (u_j)]] $

  This is known as the *determinant convention*.

  #div

  The difference between the "$"Alt"$ convention" and the "determinant convention" is mentioned in _Introduction to Riemannian Manifolds_ ($2$nd edition) [John M. Lee ("Differential forms and integration" section of Appendix B)], and the scaling by $n!$ issue is mentioned in section $44.5$ of _An Infinitely Large Napkin_ (Evan Chen, version: v1.6.20250213).

  \

  This is the *#pnote[$2^"nd"$ choice]* we have to make, and it will determine what isomorphism we shall use between $Lm^n (V^*)$ and $Lm^n (V)^*$

  Moving onwards, we will be using the *determinant convention*.
]

// #notebox[
//   We would like to show that the above chain is indeed an isomorphism between $Lm^n (V)^*$ and $Lm^n (V^*)$. Following are 2 approaches that might work.
  
//   #divdash
  
//   #rect(width:100%)[
//     In the category $k$-Vect, if we have an injection $f$ followed by a surjection $pi$ in the following way $ A arrow.hook^f B ->>^pi C, $ then $pi compose f$ is an isomorphism iff $B isom im(i) plus.o ker(pi)$.
  
//     This is probably true for any Abelian category, #pnote[need to check].
//   ]
  
//   If we can show that $im(pi_1^*) plus.o i^(-1)(ker(pi_2)) isom T^n (V)^*$, then we are done in showing that $pi_2 compose i compose pi_1^*$ is an isomorphism. #try : (i) Decompose arbitrary $v in T^n (V)^*$ into the direct sum components, and (ii) show that the direct sum components intersect at ${0}$.

//   #divdash

//   If we can show that the chain of morphisms given above is injective, then equality of dimension will establish that it is a bijection.
// ]

#divdash

#notebox[
  The Leibniz determinant formula states that: $ det([a_(i j)]_(n times n))=sum_(sigma in S_n) sgn(sigma) a_(1 sigma(1))...a_(n sigma(n)) $
]

#divdash

Now, we would like to describe multiplication over $ldsum_(n>=0) Lm^n (V)$ and over $ldsum_(n>=0) V_"alt"^n$.

#notebox[
  For both multiplications, we would be using the same symbol "$and$".
]

Recall that $Lm^n (V)$ is defined to be a quotient of $T^n (V)$, and we have already defined multiplication over $dsum_(n>=0) T^n (V)$, so for $[v_1] in Lm^k (V),[v_2] in Lm^l (V)$ (for some $v_1 in T^k (V),v_2 in T^l (V)$), we define the product of $[v_1]$ and $[v_2]$ as $ [v_1] and [v_2]=[v_1 tensor v_2] in Lm^(k+l)(V) $

\

Now, we can use the isomorphism $Lm^n (V) isom V_"alt"^n$ to get a multiplication on $ldsum_(n>=0) V_"alt"^n$. 

#notebox[
  Recall that the isomorphism that we gained canonically from the fact that the Reynolds operator ($"Alt"^n$) is a projection was $ [v] in Lm^n (V)&|-> "Alt"^n (v) in V_"alt"^n\ v in V_"alt"^n &|-> [v] in Lm^n (V) $

  Let us try using this isomorphism to get multiplication on $ldsum_(n>=0) V_"alt"^n$: #indent[
    Given $v in V_"alt"^k, w in V_"alt"^l$, they correspond to $[v] in Lm^k (V),[w] in Lm^l (V)$, which multiply to give $[v tensor w] in Lm^(k+l) (V)$, which corresponds to $"Alt"^(k+l) (v tensor w)=1/(k+l)! sum_(sigma in S_(k+l)) sigma(v tensor w)$. So, the multiplication we get is $ v and w = "Alt"^(k+l) (v tensor w) $
  ]

  The above formulation doesn't have any $binom(k+l,k)$ scalar in it, while Spivak does. My guess at how that might be arising is  that instead of using the above isomorphism, Spivak uses $v|->1/n! [v];[v]|->n! "Alt"^n (v)$. If we use _that_ isomorphism, then #indent[
    Given $v in V_"alt"^k, w in V_"alt"^l$, they correspond to $1/k![v] in Lm^k (V),1/l! [w] in Lm^l (V)$, which multiply to give $1/(k!l!)[v tensor w] in Lm^(k+l) (V)$, which corresponds to $binom(k+l,k)"Alt"^(k+l) (v tensor w) in V_"alt"^(k+l)$. So, the multiplication we get is $ v and w = binom(k+l,k)"Alt"^(k+l) (v tensor w) $
  ]

  \

  Have a look at the description of #pnote[*$1^"st"$ choice*] above.
]

#divdash

Given basis ${e_1,...,e_d}$ of $V$, and vectors $v_1,...,v_d  in V$ such that $ mat(e_1,...,e_d)A_(d times d)=mat(v_1,...,v_d), $ we have $v_1 and ... and v_d in Lm^d (V)$, and simplifying, we get that $ v_1 and ... and v_d =det(A) dot e_1 and ... and e_d $

#divdash

Given a $k$-linear map $phi:V->W$, we have a map $T^n (phi):T^n (V)->T^n (W)$ given by $(v_1 tensor ... tensor v_n)|-> (phi(v_1) tensor ... tensor phi(v_n))$.

Now, $pi compose T^n (phi) := (v_1 tensor ... tensor v_n)|-> phi(v_1) and ...   and phi(v_n)$ is an alternating map from $T^n (V)$ to $Lm^n (W)$, and so we get an unique map $Lm^n (phi):Lm^n (V)->Lm^n (W)$.

#notebox[
  This shows that $Lm^n$ is  functorial, just like $T^n$.

  Note that $Lm^0$ is also functorial, with the object map being $A|->(Lm^0 A=k)$ and $f in Hom(A,B)|->(Lm^0 f=id_k) in Hom(k,k)$.
]

\

Given basis $B_V={u_1,...,u_k}$ for $V$ and $B_W={w_1,...,w_l}$ for $W$. Suppose the matrix of $phi$ with respect to this basis is $A_(l times k)$.

Suppose $n<=min(k,l)$. Then we have basis $B^0_V={u_i_1 and ... and u_i_n : 1<=i_1<...<i_n<=k}$ for $Lm^n (V)$ and $B^0_W={w_j_1 and ... and w_j_n:1<=j_1<...<j_n<=l}$ for $Lm^n (W)$. Then, for some fixed $1<=i_1<...<i_n<=k$, we have $ Lm^n (phi)(u_i_1 and ... and u_i_n)&=phi(u_i_1) and ... and phi(u_i_n) $

Fix some $1<=j_1<...<j_n<=l$. We can write $Lm^n (phi)(u_i_1 and ... and u_i_n)$ in the basis $B_W^0$, and the coordinate along $w_j_1 and ... and w_j_n$ will be $ &sum_(sigma in S_n) (product w^(j_(sigma(k)))(phi(u_i_k))) dot w_j_(sigma (1)) and ... and  w_j_(sigma(n)) \ =&sum_(sigma in S_n) sgn(sigma) dot (product A_(sigma(k),k)) dot w_j_(1) and ... and w_j_n \ =& det("minor"_(n times n)(A,(i_1,...,i_n),(j_1,...,j_n))) dot w_j_1 and ... and w_j_n $

So, the matrix of $Lm^n (phi)$ will have determinants of $n times n$ minors of $A$ as its entries.

#divdash

Therefore, given $phi:V->V$ with matrix $A$ wrt basis ${e_1,...,e_d}$, $Lm^d phi$ will have matrix $mat(det(A))$ with respect to the basis ${e_1 and ... and e_d}$.

*But now*, a nice thing happens. $Lm^d (V)$ is $1$-dimensional, and therefore the only data that $Lm^d (phi)$ stores is a single scalar  value, which in this case happens to be $det(A)$.

#notebox[
  So, given $phi in "End"_k (V)$, $Lm^d (phi) in "End"_k (Lm^d (V))$ is the map "scaling by $det(phi)$".

  This gives us a basis free definition of $det(phi)$, so we can take *determinants of endomorphisms over finite dimensional vector spaces.*
]

#divdash

#notebox[
  The  following discussion is when the base field $k$ is equal to $RR$.
]

When do two basis $B_u={u_1,...,u_d}$ and $B_v={v_1,...,v_d}$ of a vector space $V$ have the *same orientation*?

#ibox[#underl[1st try]][
  When the change of basis matrix from $B_u$ to $B_v$ has positive determinant.
]

#ibox[#underl[2nd try]][
  $u_1 and ... and u_d$ and $v_1 and ... and v_d$ are both vectors in the $1$-dimensional vector space $Lm^d (V)$, so each of them is a scalar multiple of the other. If the scalar is positive, then they have same orientation; otherwise not.
]

#ibox[#underl[3rd try]][
  For every $omega in Lm^d (V)^*$, we have $omega(u_1 and ... and u_d)=det(A) omega(v_1 and ... and v_d)$, if $mat(v_1,...,v_d)A=mat(u_1,...,u_d)$. Define that $B_u$ and $B_v$ have same orientation iff $ forall omega in Lm^d (V)^*, omega(u_1 and ... and u_d) "and" omega(v_1 and ... and v_d) "have the same sign." $
]

#divdash