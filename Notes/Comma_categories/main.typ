#import "../math_template.typ" : *
#import "@preview/commute:0.3.0" : *
//Can do rough sketching on https://t.yw.je/

#show : start.with(
  title   : "Comma categories",
  author  : "Soham Saha"
)

_Have a look at the above page *Free constructions* for a nice discussion._

A comma category might be thought of as a way of talking about functions between objects which belong to $2$ different categories, by bringing them on the same playing field, a common category. We will be trying to match the notation on this Wikipedia page: https://en.wikipedia.org/wiki/Comma_category

Suppose we have two categories $cat(A)$ and $cat(B)$, and we want to talk about functions of type $A->B$, with $A in obj(cat(A)), B in obj(cat(B))$. We want to create a new category where the _objects_ will be such functions.

First, we need a common category where can put the objects from $cat(A)$ and $cat(B)$ into. Suppose we have such a category $cat(C)$ and 2 functors, $S:cat(A)->cat(C)$ and $T:cat(B)->cat(C)$. (They stand for "source" and "target", since $S$ embeds the domains of the functions we want to define into $cat(C)$, while $T$ embeds the codomains).

Now, we define our category $S arrow.b T$. Its objects are tuples $(A,B,h)$ with $A in obj(cat(A)), B in obj(cat(B)), h in Hom_cat(C)(S(A),T(B))$. [Therefore the objects encode the function which we want along with information about its domain and codomain]. Morphisms between these "functions" are pairs of morphisms between their "domains" and "codomains" (such that they play compatibly with the functions); therefore, a morphism between $(A,B,h)$ and $(A',B',h')$ is a pair $(f,g)$ with $f:A->A', g:B->B'$ such that $T(g) compose h=h' compose S(f)$. 

#columns(2)[
  
  #image("Comma_category.jpeg",width:120%)

  #align(center, commutative-diagram(node-padding:(30pt,30pt),
    node((0, 0), [$A$]),
    node((0, 2), [$A'$]),
    node((2, 0), [$S(A)$]),
    node((2, 2), [$S(A')$]),
    node((0, 1), []),
    node((2, 1), []),
    node((4, 0), [$T(B)$]),
    node((4, 2), [$T(B')$]),
    node((6, 0), [$B$]),
    node((6, 2), [$B'$]),
    node((6, 1), []),
    node((4, 1), []),
    arr((0, 0), (0, 2), [$f$]),
    arr((0, 0), (2, 0), [$S$], "dashed"),
    arr((0, 2), (2, 2), [$S$], "dashed"),
    arr((2, 0), (2, 2), [$S(f)$], label-pos: right),
    arr((0, 1), (2, 1), [$S$], "dashed"),
    arr((2, 0), (4, 0), [$h$]),
    arr((2, 2), (4, 2), [$h'$]),
    arr((6, 0), (6, 2), [$g$], label-pos: right),
    arr((6, 0), (4, 0), [$T$], label-pos: right, "dashed"),
    arr((6, 2), (4, 2), [$T$], label-pos: right, "dashed"),
    arr((4, 0), (4, 2), [$T(g)$]),
    arr((6, 1), (4, 1), [$T$], label-pos: right, "dashed"),
  ))
]

#notebox[
  === Fun fact! 
  
  The category of graphs #cat[Gph] can be described as $(id_cat("Set") arrow.b D)$, where $D$ is an endofunctor on #cat[Set], mapping $S|-> S times S$. Objects in #cat[Gph] are triplets $(a,b,f:a-> b times b)$, where $a$ is the "edge indexing set", picking out its endpoints from the vertex set $b$.
]