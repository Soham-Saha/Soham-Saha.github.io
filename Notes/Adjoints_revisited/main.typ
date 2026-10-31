#import "../math_template.typ" : *
#import "@preview/commute:0.3.0" : *
//Can do rough sketching on https://t.yw.je/

#show : start.with(
  title   : "Adjoints revisited",
  author  : "Soham Saha"
)

In the previous note on adjoints we saw how an adjoint can be thought of as particular hom-set bijection. Here, we show how this definition relates to the universal morphism based definition and the unit-counit definition.

We shall also demonstrate a startling lack of proofs of any sort, relying on the unfortunate reader to work them out themselves.

#div

Throughout this note, assume that we have categories $cat(C),cat(D)$, and a functor $R:cat(C)->cat(D)$.

First, observe that if we have $L tack.l R$ for some functor $L:cat(D)->cat(C)$, then we have a universal morphism from every $X in obj(cat(D))$ to the functor $R$; namely $(L(X),i_X:X->R L(X))$, where $i_X$ is $id_L(X)$ carried through the hom-set bijection given by the adjoint property.

Now, we ask two questions:

1. Is the presence of universal morphisms from every $X in obj(cat(D))$ to $R$ enough to guarantee a left adjoint functor for $R$?
2. What universal property does a left adjoint of $R$ satisfy?

Let us resolve these questions one by one.

#divdash

For the first question, we assume that we have universal morphisms from every $X in obj(cat(D))$ to $R$; let us name them $(X^*, i_X : X->R(X^*))$.

Define hom-set bijection $phi_(X,A):Hom(X,R(A))->Hom(X^*,A)$ defined as $f:X->R(A)$ maps to $g :X^*->A$ where $g$ is the unique morphism from $(X^*,i_X)$ to $(A,f)$ in the comma category $(X arrow.b R)$. Observe that we have $R(g) compose  i_X=f$.

  Define functor $L:cat(D)->cat(C)$ with
  - object map : $X in obj(cat(D))$ maps to $X^*$, where $(X^*,i_X:X->R(X^*))$ is a universal morphism from $X$ to $R$.
  - morphism map : $(A arrow.long^f X)|->phi(phi^(-1)(id_L(X)) compose f)=phi(R(id_L(X)) compose i_X compose f)=phi(i_X compose f)$.

This functor $L$ is a left adjoint of $R$.

So there we have it; the hom-set bijection definition of $R$ having a left adjoint is equivalent to having universal morphisms from every $X in obj(cat(D))$ to $R$.

#divdash

Now we shall approach the second question using our "newly discovered" universal morphism based definition of left adjoint.

We want to pack all this data together as a single universal morphism data. So ultimately, we want to get a comma category where the initial object will carry the data of all of these universal morphisms together.

So, in the comma category that we want, we want objects to carry the data $ {X arrow.long^(f) R(Y): X in obj(cat(D)),Y in obj(cat(C)), Y "somehow depends on" X}, $ and each morphism would be a _set_ of commutative diagrams, each of which looks like 
#align(center, commutative-diagram(node-padding:(25pt,25pt),
  node((0, 1), [$X$]),
  node((2, 0), [$R(Y)$]),
  node((2, 2), [$R(Y')$]),
  arr((2, 0), (2, 2), [$R(g)$]),
  arr((0, 1), (2, 0), [$f$], label-pos: right),
  arr((0, 1), (2, 2), [$f'$]),
))

Observe that the objects of the comma category would be morphisms in the mediating category (the "playground" of the comma category construction).

Now, the data of the objects in the comma category (morphisms in the mediating category) seems awfully like the set of components of a natural transformation. So, morphisms in the mediating category are natural transformations from the functor $id_cat(D)$ to some other $cat(D)->cat(D)$ functor.

Observe again the data of the objects in the comma category, $Y$s are dependent on the $X$s somehow, through a functor perhaps? So, we want natural transformation from $id_cat(D)$ to functors of the form $R compose -$.

So now, we consider the comma category $id_cat(D) arrow.b (R compose -)$, where $R compose -$ is a functor from $[D,C]->[D,D]$, and $id_cat(D) in [D,D]$ as expected. $(L,tau:"Nat"(id_X, R L))$ is an initial object here where $tau$ carries the data of the universal morphisms that we have as its components.

This natural transformation $tau$ is known as the "unit".

#try : Develop to include counit, then deploy the unit-counit definition.