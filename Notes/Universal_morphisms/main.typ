#import "../math_template.typ" : *

#show : start.with(
  title   : "Universal morphisms",
  author  : "Soham Saha"
)

Let us have a look at Wikipedia:
#align(center,image("universal_morphisms.png"))
\
In the first case (universal morphism from $X$ to $F$), the pair $(A,u:X->F(A))$ is universal in the sense that any pair $(A',u':X->F(A'))$ factors uniquely through $h:A->A'$.

We can also reconcile this idea with comma categories, by saying that $(A,u)$ is initial in the comma category $!_X arrow.b F$.

Dually speaking, universal morphisms from $F$ to $X$ correspond to terminal objects in the comma category $F arrow.b !_X$.