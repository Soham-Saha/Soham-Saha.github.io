#import "../math_template.typ" : *

#show : start.with(
  title   : "Free constructions",
  author  : "Soham Saha"
)


_Inspired by Section 1.7, "Free categories", Awodey._

Vague description of the problem: #indent[
  Given an object $X$ with algebraic structure $A_1$, "freely" construct an object $Y$ of algebraic structure $A_2$.
]

#notebox[
  Some instances might be:
  - Given a set $S$, freely construct a group from it.
  - Given a set $S$, freely construct a monoid from it.
  - Given a (directed) graph $G$, freely construct a category out of it.
]

Attempt to formalize: #indent[
  Given categories $cat(C), cat(D)$, an object $X in obj(cat(C))$, and a functor $F:cat(D)->cat(C)$, $Y in obj(cat(D))$ produced by ??? from $X$ is called the "free construction of an object of algebraic structure $cat(D)$ from $X$".

  _$F$ is called the forgetful functor from $cat(D)$ to $cat(C)$._
]

Attempt #2: #indent[
  Given categories $cat(C), cat(D)$, an object $X in obj(cat(C))$, and a functor $F:cat(D)->cat(C)$, we call $Y in obj(cat(D))$ the "free construction of an object of algebraic structure $cat(D)$ from $X$" iff $ exists i_X in Hom_C (X,F(Y)), "such that," \ forall Z in obj(cat(D)), forall f in Hom_C (X,F(Z)), exists ! phi in Hom_D (Y,Z), f =F(phi) compose i_X $

  Observe that we need $i_X$ alongside $Y$ to define the free construction. To be less symbolically acute, given any $Z in obj(cat(D))$, and any morphism $f$ (in $cat(C)$) from $X$ to $F(Z)$, there exists a unique morphism $phi$ (in $cat(D)$) such that $f=F(phi) compose i_X$.

  #align(center,image("free_construction.jpeg", width:90%))

  Observe that this means that $Hom(Y,Z) isom Hom(X,F(Z))$, i.e., $ Hom("Free"(X),Z) isom Hom(X,"Forget"(Z)). $
]

#notebox[
  Can this be simplified to say that the tuple $(i_X,F(Y))$ is an initial object of the coslice category $X\/F(cat(D))$? Is there a nice way to define $F(cat(D))$ as a subcategory of $cat(C)$ to make this work?
  
  If the forgetful functor $F$ was faithful, then this does make sense, because a unique $F(phi)$ (produced when the initial object in the coslice category is presented with $(f, F(Z))$) would uniquely identify $phi$. [Nah, still wrong, the produced function may not be of the form $F(phi)$... Looks like a deadend here.]

  #divdash

  Or maybe I am considering the wrong category to find initial objects in.
  
  Instead of taking the coslice category, consider the category where objects are tuples $(f,Z) [Z in obj(cat(D)), f in Hom_C (X,F(Z))]$, and morphisms between $(f_1,Z_1)$ and $(f_2,Z_2)$ correspond to morphisms $psi:Z_1->Z_2$ such that $F(psi) compose f_1=f_2$. Initial objects in this category correspond to $(i_X,Y)$.

  #divdash

  The Wikipedia article on comma categories mentions that while in the most general case it is defined on two functors $S$ and $T$ which share the same codomain, most of the time one of the two functors has domain #cat[1] (the one-object category).
  
  Indeed, the category that we have described above is the comma category $!_X arrow.b F$, where $!_X:cat(1)->cat(C)$, maps the single object in $cat(1)$ to $X$ in $cat(C)$. So, a free construction based on the object $X$ corresponds to initial objects in $!_X arrow.b F$. _Have a look at the *Comma categories* page down below._

  #divdash

  An even more natural perspective is through *universal morphisms*. The diagram drawn above is exactly what it means for $(Y,i_X)$ to be a universal morphism from $X$ to the forgetful functor $F$. Therefore, universal morphisms from $X$ to the forgetful functor correspond to free constructions on $X$. _Have a look at the *Universal morphisms* page below._
]

#notebox[
  If we think of $X$ as a set, and $Z$ as a group, then $(Y,i_X)$ being a free group simply means that any "function from $X$ to $Z$" "uniquely factors through" the function $i_X$ via a homomorphism from $Y$ to $Z$.

  The above wording "identifies" each group with its underlying set. Functions from $X->Z$ are actually morphisms in #cat[Set] from $X->F(Z)$, and so on.

  The above "factoring through" notion fits nicely with the idea of $(Y,i_X)$ being initial in $!_X arrow.b F$ which is described above.
]

#notebox[
  Wikipedia says "Forgetful functors tend to have left adjoints, which are 'free' constructions"(https://en.wikipedia.org/wiki/Forgetful_functor). So this might be a route to learning adjoints.

  Read the part "Left adjoints of forgetful functors" on the Wiki page linked above. There is some nice intuition there,  also something about a vector space being a free construction on its basis set.
]
