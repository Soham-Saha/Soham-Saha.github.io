#import "../math_template.typ" : *

#show : start.with(
  title   : "Natural isomorphism",
  author  : "Soham Saha"
)

Recall the definition of adjoint functors,

#indent[
  Functors $F:cat(C)->cat("D"), G:cat("D")->cat(C)$ are called adjoints of each other iff $ forall c in "Obj"(cat(C)), d in "Obj"(cat("D")), Hom_cat(C)(c,G(d)) isom Hom_cat("D")(F(c),d), $ and the isomorphism is *natural* in $c$ and $d$.
]

#divdash

Now, observe this definition of representable multicategory,

#align(center, image("representable_multicategory_1.png", width:80%))

#divdash

Both definitions talk of an isomorphism being natural in some parameters.

Consider two functors $F, G:cat(C)->cat("D")$, and natural transformations $tau_1 : F -> G, tau_2:G->F$ such that $tau_1 compose tau_2 = id_G, tau_2 compose tau_1 = id_F$.

Then we say that for any $y in "Obj"(cat(C))$, $F(y)$ and $G(y)$ are isomorphic (via the morphisms $tau_1 (y)$ and $tau_2(y)$), and the isomorphism is natural in the parameter $y$.