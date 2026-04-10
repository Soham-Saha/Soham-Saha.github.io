#import "../math_template.typ" : *

#show : start.with(
  title   : "Semidirect products",
  author  : "Soham Saha"
)

=== Semidirect product

Suppose we are given $H,K normal G$, $H inter K={e}$, and $H K=G$ (as sets). Recall that these were the conditions required for $G$ to be expressed as the internal direct product of $H$ and $K$. Also remember that to prove that $(h,k)|-> h k$ is an homomorphism, we needed $h_1 k_1 h_2 k_2=h_1 h_2 k_1 k_2$, i.e., we needed $forall h in H, k in K$, $h k=k h$. And to prove that this was true, we needed to use the fact that $H, K normal G$.

But what if we have $H, K <=G$, but we do not have $forall h in H, k  in K, h k=k h$? (We still have that $H inter K={e}$ and $H K=G$ (as sets)).

In the most general case, instead of $h k=k h$, we have $h k=phi_h (k)h$, where $phi_h (k)=h k h^(-1)$. But in this case we are not even guaranteed that $phi_h$ restricts to $K$, i.e., it is not  generally true that $forall k in K,phi_(h) (k)in K$.

To simplify life, instead of considering the fully general case where $H, K <=G$, we assume that $H <=G, K normal G$, so that we _now_ have $forall k in K, phi_h (k) in K$.

The setup therefore now becomes $H<=G, K normal G$, $H inter K={e}$, $H K=G$ (as sets), and $phi:H-> "Aut"(K):=h |-> (k |-> h k h^(-1))$. We have that $forall h in H, k in K, h k= phi_(h) (k) h$. Just as previous, we want to place a suitable group structure on the Cartesian product $K times H$ so that $psi:K times H->G:=(k,h)|->k h$ ascends from being a set bijection to a group isomorphism. So, we just have to define what the binary operation on $K times H$ should be.

Now, observe that, for $psi$ to be an isomorphism, we need $psi((k_1,h_1))psi((k_2,h_2))=psi((k_1,h_1) dot (k_2,h_2))=>k_1 h_1 k_2 h_2=psi((k_1,h_1) dot (k_2,h_2))$. We already have by hypothesis, that $h_1 k_2=phi_(h_1) (k_2) h_1$. Therefore, $psi((k_1,h_1) dot (k_2,h_2))=k_1 phi_(h_1)(k_2) h_1 h_2$. From here we try to guess what $(k_1,h_1) dot (k_2,h_2)$ could have been (remembering the restrictions that the "$dot$" is associative and respects identity and inverse in $K times H$). The guess that works is $ (k_1,h_1)dot (k_2,h_2)=(k_1 phi_(h_1)(k_2),h_1 h_2) $

And this raises $K times H$ to a group, and by the isomorphism $psi$, we say that $G$ is the internal semidirect product $K semidirect_phi H$.

Generalizing over $phi$, we define the external semidirect product: 
#indent[
  Given groups $H$ and $K$, and a homomorphism $phi:H->"Aut"(K)$, we define the group $K semidirect_phi H$ over the set $K times H$ with the operation $ (k_1,h_1)dot (k_2,h_2)=(k_1 phi_(h_1)(k_2),h_1 h_2) $ 
]

Observe that when we say $G$ is the internal semidirect product of $K normal G$ and $H<=G$, then we are using $phi:=h|-> (k|-> h k h^(-1))$. Therefore, for internal semidirect products, we can drop the $phi$ and just write $K semidirect H$.

#divdash


=== Warning!

If the set bijection that you are using is $psi:K times H->G:=(k,h)|->k h$, then the inner product thing described above works perfectly fine. But if you place the normal subgroup on the _right_, i.e., $psi':H times K->G:=(h,k)|-> h k$, then the operation on $H times K$ has to be modified $ (h_1,k_1) dot (h_2,k_2)=(h_1h_2,phi_(h^(-1)_2)(k_1)k_2). $

and you'd have to write $H times.l_phi K$ instead.

Instead of hammering through all this hogwash, just stick to writing the normal on the left and you'd be fine.

#divdash

=== Even more generality?

The most general case, where we just have $H ,K <=G$, $H inter K={e}$, and $H K=G$ (as sets) is handled by the #link("https://en.wikipedia.org/wiki/Zappa%E2%80%93Sz%C3%A9p_product")[knit product], also known as the Zappa–Szép product.

Observe that direct product, semidirect product and the knit product are "similar" in the sense that

- They have the same underlying set, namely $H times K$.
- They have subgroups isomorphic to $H$ and $K$, namely $H times {e_K}$ and ${e_H} times K$ respectively.
- They are attempts to make a larger group out of the two given groups $H$ and $K$.

The differences lie in what $h k$ is assumed to be equal to:
- For the direct product $H times K$, we have $h k=k h$.
- For the semidirect product $K semidirect_phi H$ (where $phi:H->"Aut"(K)$), we have a "twist" on one side, $h k=phi_(h)(k)h$. 
- For the knit product of $H$ and $K$, we have $phi:H->"Sym"(K), psi:K->"Sym"(H)$, and $h k=phi_h (k) psi_k (h)$, "twisting" on both sides.

#divdash

=== Notation alert!

The symbol $semidirect$ is a mashup of $times$ and $normal$. Since the normal subgroup is written towards the pointy side of $normal$, we have to write it on the left of $semidirect$. Therefore, we have $K normal (K semidirect_phi H)$.

#divdash

=== Another idea

If we have $K normal G$, then we have a surjective homomorphism $f:G->H$ such that $ker(f)=K$. By the first isomorphism theorem, we have $G\/K isom H$. 

If we can embed $H$ back in $G$ (i.e., we have an injective homomorphism $g$ from $H$ to $G$) such that $f|_(g(H))=id$, then $G$ is the internal semidirect product of $K$ and $g(H)$. We can represent $G$ as the split extension of $K$ and $H$, $ 1->K->G->H->1 $

An alternative way of phrasing this is that $G isom K semidirect_psi G\/K$ iff the quotient map  $pi:G->G\/K$ *splits*, meaning that $ exists sigma:G\/K->G "s.t." pi compose sigma isom id_(G\/K) $

#divdash

=== A nice property

For groups $A,B,C$, given $phi:B->"Aut"(A)$, define $psi:B->"Aut"(A times C):=psi_b ((a,c))=(phi_b (a),c)$. Then we have $ (A semidirect_phi B) times C isom (A times C) semidirect_psi B $

If we had rather defined $psi':B->"Aut"(C times A):=psi_b ((c,a))=(c,phi_b (a))$, then we'd get $ C times (A semidirect_phi B) isom (C times A) semidirect_psi B $

#divdash

=== "Internal"?

Suppose we have a group $G$. If I have $H,K <=G$, then $G$ is the internal "whatever" product of $H$ and $K$ iff given a group structure on $H times K$, the set function $f:H times K->G:=(h,k)|->h k$ is an isomorphism. What group structure we choose to provide on $H times K$ decides if we get direct, semidirect or knit product.

Suppose we have a vector space $V$, and we have $U,W$ as subspaces of $V$. We call $V$ the internal direct sum of $U$ and $W$ if the default vector space on $U times W$ is isomorphic to $V$ via $f:U times W:=(u,w)|->u+w$.

So given an algebraic structure $A$, and a notion of composition of elements of $A$ (i.e., a function $*:A times A->A$), if we have $B$ and $C$ as substructures of $A$, then we call $A$ as the internal product of $B$ and $C$ iff we can place the same algebraic structure on $B times C$ and the set function $f:B times C->A:=(b,c)|->b * c$ is an isomorphism.

#try : The last formulation is almost categorical. Refine and polish.

#divdash

=== Nothing is "external"

Given groups $A$ and $B$, and $phi:B->"Aut"(A)$, define the external semidirect product $A semidirect_phi B$.

Now, we have $A times {e} normal A semidirect_phi B$ and ${e} times B <= A semidirect_phi B$. 

As in the previous section, to show that $A semidirect_phi B$ is the _internal semidirect product_ of $A times {e}$ and ${e} times B$, we have to define a group structure on the Cartesian product $(A times {e}) times ({e} times B)$. To define a group structure, we just need a way define composition of two elements of $(A times {e}) times ({e} times B)$, which we get naturally from the operation on $A semidirect_phi B$. Now, we just have to verify that $f:(A times {e}) times ({e} times B)->A semidirect_phi B |-> (b,c)|->b c$ is an isomorphism, which is easy to do in this case.

Therefore, we have $A semidirect_phi B$ as the external semidirect product of $A$ and $B$ and the internal semidirect product of $A times {e}$ and ${e} times B$.

Also observe that had we tried to build up the internal semidirect product of $A times {e}$ and ${e} times B$, we would have chosen $phi_"conj":{e} times B -> "Aut"(A times {e}):=x|->(y|->y x y^(-1))$, which simplifies to $phi_"conj" ((e,b))|->(phi_b (a),e)$, and therefore, $phi_"conj"$ is just $phi$ up to $A isom A times {e}$ and $B isom {e} times B$.

#divdash

=== Ahoy, mate! Stop right there!

That is, stop unless you are actually busy or something.

Suppose you are given some group $G$, and are told that $abs(G)=p q$ with $q>p$, and $p,q$ are both primes. You can always get $H normal G$ such that $abs(H)=q$. You can also get $K <= G$ such that $abs(K)=p$. Since $f:H times K->G:=(h,k)|->h k$ is injective in this case, so $G=H K$ (as sets), and we have $H inter K={e}$. So, are we done classifying $G$ as internal semidirect product of $H$ and $K$? Is that the only possible $G$?

Well, yes and no. You are correct in saying that $G$ is just $H semidirect_phi K$, where $phi_k=k h k^(-1)$, but that doesn't fix $G$ up to isomorphism. 

Now you start screaming: $H$ and $K$ are fixed up to isomorphism, we have $H isom ZZ_p$ and $K isom ZZ_q$, and we also know what $phi:K->"Aut"(H)$ is. What else is there to know?

"Aha!", I say. "Think again, do you know what $phi$ is?" You see, we know $phi$ only if we already know how elements of $K$ act to conjugate $H$. You'd know that if you had the operation on $G$ already, but you do _not_ know that.

"Hmm...", you say, nodding gravely. "Thanks for this unwanted info-dump".