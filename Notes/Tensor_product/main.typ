#import "../math_template.typ" : *

#show : start.with(
  title   : "Tensor product",
  author  : "Soham Saha"
)

#let tensor = $times.o$
#let bigtensor = $times.o.big$

\

#notebox[
  This write-up is going to be more of a "collection of facts" than "actually stating and proving stuff". We shall see the general definition of the tensor product and see what nice connections we can find.
]

Consider a multicategory $cat(C)$. Given arbitrary objects $A_1,...,A_k,X in "Obj"(cat(C))$, let us name $cat(C)_k (A_1,...,A_k;X)$ as the set of multimorphisms of type $A_1,...,A_k -> X$.

Given objects $A$ and $B$ in $cat(C)$, if there exists a tuple $(T in "Obj"(C),phi in cat(C)_2(A,B;T))$ such that given an arbitrary object $X$, any multimorphism from $A,B$ to $X$ factors uniquely through $phi$, then $(T,phi)$ is known as the *tensor product* of $A$ and $B$.

#notebox[
  Referring to Claudio Hermada's _Representable multicategories_,
  #align(center, image("representable_multicategory_1.png", width:80%))

  #align(center, image("representable_multicategory_2.png", width:80%))

  Note that the mere existence of all $n$-ary tensor products is not sufficient to guarantee that the tensor product is associative.
]

Therefore, in a representable multicategory, all $n$-ary tensor products exist and binary tensor product is associative.

#divdash

We can define a multicategory $cat(M_1)$ where the objects are from $k"-Vect"$, and the set of multimorphisms $cat(M_1)(A_1,...,A_n,B)$ is the set of all multilinear maps from $A_1 times ... times A_n$ to $B$. The set of multimorphisms $cat(M_1)(;B)$ is defined as the set of vectors in $B$ itself, and the reason why we do that will be evident soon. Multimorphism composition can be defined easily.

Observe that $cat(M_1)$ is a representable multicategory, with the tuple $(A_1,...,A_n)$ being "represented" by $A_1 tensor ... tensor A_n$ and the universal multimorphism from $A_1,...,A_n$ to $A_1 tensor ... tensor A_n$ being the canonical multilinear map.

#notebox[
  The reason why we have $cat(M_1)(;B)$ as the set of all vectors in $B$ is because we *want* the representing object for the empty list to be $bigtensor_(A in phi.alt) A=k$, where we are thinking of $k$ as a $k$-vector space. So, we want multilinear maps (multimorphisms in $cat(M_1)$) from the empty list to $B$ to be linear maps (morphisms in $k$-Vect) from $k$ to $B$, which are in one-to-one correspondence with vectors from $B$.

  We can go a step further and ask why we want $bigtensor_(A in phi.alt)$ to be $k$. Firstly, any other choice (something not isomorphic to $k$) for the representing object of the empty list will _not_ make $cat(M_1)$ into a representable multicategory. Also, as we will see in a later section, $k$-Vect is a monoidal category (with the monoidal product being $tensor$), and therefore has a canonical representable category, and the representing object of the empty list is just the unit of the monoidal category, which is $k$ in $k$-Vect.
]

\

We can also define yet another multicategory $cat(M_2)$, where the objects are still from $k$-Vect, but the set of multimorphisms $cat(M_2)(A_1,...,A_n;B)$ is defined as $product_A_i Hom_(k"-Vect") (A_i,B)$. Observe that $cat(M_2)(;B)$ is therefore defined as $product_(A_i in phi.alt) Hom_(k"-Vect") (A_i, B)={*}$, the empty product.

$cat(M_2)$ is a representable multicategory, with the $(A_1,...,A_n)$ being represented by $plus.o.big_(i) A_i$ and the universal morphism being the tuple of inclusion maps.

#notebox[
  Observe that again, multimorphisms from the empty list to $B$ are in one-to-one correspondence with morphisms from the representing object of the empty list $plus.o.big_(A in phi.alt) A={0}$ to $B$. The same discussion above goes through, as $k$-Vect is also a monoidal category with $plus.o$ as the monoidal product.
]

\

So, in $cat(M_1)$, we get the tensor product to be $tensor$, and in $cat(M_2)$, we get the tensor product to be $plus.o$. The reason why we prefer $tensor$ as the tensor product over $k$-vector spaces instead of $plus.o$ will be discussed in a later section.

#divdash

Any monoidal category $(cat(D), tensor, 1)$ canonically defines a canonical representable multicategory where the objects are from $cat(D)$, and the set of multimorphisms from $A_1,...,A_n$ to $B$ is defined as $Hom_cat(D) (A_1 tensor ... tensor A_n, B)$. The set of multimorphisms from the empty list to $B$ is defined as $Hom_cat(D)(1,B)$. The $n$-tuple $(A_1,...,A_n)$ has $(A_1 tensor ... tensor A_n)$ as its representing object, with the universal multimorphism being just $id_(A_1 tensor ... tensor A_n)$.

Any closed category $cat(D)$ canonically defines a (closed) multicategory where the objects are from $cat(D)$, and the set of multimorphisms from $A_1,...,A_n$ to $B$ #try

#try : Now tell adjoint property of closed monoidal categories.

#divdash

Let us go back to our multicategories $cat(M_1)$ and $cat(M_2)$.

Observe that $cat(M_1)$ is the canonical representable multicategory induced by the monoidal category $k$-Vect (where the monoidal product is $tensor$), while $cat(M_2)$ is the canonical representable multicategory induced by the monoidal category $k$-Vect (where the monoidal product is $plus.o)$.

Now, $k$-Vect has the additional structure of being a closed category, with the internal hom $[V,W]$ being the $k$-vector space structure on $Hom_k (V,W)$.

The monoidal category $k$-Vect (with $tensor$ as the monoidal product) becomes a closed monoidal category under the above interpretation of $k$-Vect as a closed category. Therefore, here the tensor product in $cat(M_1)$ satisfies the nice adjoint property that for any $k$-vector space $B$, $ Hom_k (A tensor B,C) isom^("natural in" A, C) Hom_k (A,[B,C]) <=>- tensor B tack.l [B,-] $

However, the monoidal category $k$-Vect (with $plus.o$ as the monoidal product) doesn't form a closed monoidal category under the same interpretation of $k$-Vect as a closed category, and therefore, we get no such thing.

So, in this particular sense, $tensor$ is a "nicer" tensor product on $k$-Vect than $plus.o$, since it uses the fact that $k$-Vect can be made into a closed monoidal category, and we also get the nice property that the functors $- tensor B$ and $[B,-]$ are adjoint functors.

#div

References:

- https://ncatlab.org/nlab/show/tensor+product
- https://ncatlab.org/nlab/show/monoidal+category
- https://ncatlab.org/nlab/show/monoid+in+a+monoidal+category
- https://ncatlab.org/nlab/show/multicategory
- https://ncatlab.org/nlab/show/representable+multicategory
- https://ncatlab.org/nlab/show/closed+category
- https://ncatlab.org/nlab/show/closed+monoidal+category
- Claudio Hermida, Representable multicategories, Adv. Math. 151 (2000), no. 2, 164-225 (https://www.sciencedirect.com/science/article/pii/S0001870899918777)