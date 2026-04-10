#import "../math_template.typ" : *

#show : start.with(
  title   : "Sections and retractions",
  author  : "Soham Saha"
)

- Given a surjective function $f:A->B$, each of the fibers over elements of $B$ are inhabited. Therefore, we can define a function $g:B->A$ which picks out one element from each fiber; i.e., $g(b)=x$ for some $x in f^(-1)(b)$. Such a $g$ is called a *section* of $f$, and it satisfied $f g =id_B$.

- Given an injective map $g:B->A$, a map $f:A->B$ which respects the bijection between $B$ and $im(g)$ is called a *retraction* of $g$, i.e., $g(x)=y=>f(y)=x$. Such an $f$ satisfies $f g =id_B$.

- If we have $g:B->A$ and $f:A->B$, such that $f g =id_B$, then $g$ is forced to be injective, while $f$ is forced to be surjective. In this case, $g$ is called a section of $f$, and $f$ is called a retract of $g$. Also in this case, $B$ is called the retract of $A$, since we can "retract" from $A$ to $B$ using $f$.

  #align(center,image("Section_retraction.jpeg",width:50%))
