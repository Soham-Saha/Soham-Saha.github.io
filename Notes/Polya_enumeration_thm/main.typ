#import "../math_template.typ" : *

#show : start.with(
  title   : "Polya enumeration theorem",
  author  : "Soham Saha"
)

=== Cycle index polynomial

Given a permutation group $G<=S_n$, the cycle index polynomial of $G$ is defined as $ Z_G (x_1,...,x_n)=1/abs(G)sum_(g in G) x_1^(c_1 (g)) ... x_n^(c_n (g))=1/abs(G) sum_(g in G)product_(i=1)^n x_i^(c_i (g)), $ where $c_i (g)$ is the number of cycles of length $i$ in the disjoint cycle decomposition of $g in G <= S_n$.

$Z_G (x_1,...,x_n)$ is sometimes also written as $Z(G;x_1,...,x_n)$.

#pnote[Observe that cycle index polynomials are defined for permutation groups, not for actions directly.] Given an action $phi:G->"Sym"(X)$, we can talk about the cycle index polynomial of $im(phi)<=S_abs(X)$, not of the action $phi$ itself.

The cycle index polynomial stores the information about _how_ a permutation group group acts on its underlying set in an algebraically nice format. It separates out the elements of $G$ based on their cycle distribution (distribution of cycle sizes in the disjoint cycle decomposition of $g in G$), and makes them independently manageable.

The division by $abs(G)$ pays tribute to the Burnside's lemma, of which this is a generalization. Observe that $c_1 (g)="fix"(g)$, and so $(partial Z_G)/(partial x_1)|_(x_1,...,x_n=1)=$ number of orbits of the action of $G$ on $[n]$.

\

=== Polya enumeration theorem

We have $Phi$ the set of "figures", and $w:Phi->NN$ (where $NN$ includes zero) is a function which assigns non-negative integer weights to each figure.

Let us have $G<=S_n$, which acts naturally on $Phi^n$, the set of $n$-tuples of figures.

Let us extend the function $w$ to $w':Phi^n->NN$, which is the "total weight" of an $n$-tuple. Observe that total weight is invariant under the action of $G$ on $Phi^n$.

Observe that the action of $G$ on $Phi^n$ induces a "symmetry" on elements of $Phi^n$; $x ,y in Phi^n$ are isomorphic (or symmetrically identical) if they belong to the same orbit of the action.

Given $j in NN$, we want to count the number of non-isomorphic (under the symmetry induced by the action) elements of $Phi^n$ which have total weight $j$. Let us call this number $b_j$. The generating function of $b_j$ is defined as $ b(t)=sum_(i>=0)b_i t^i. $

Now, let us define the figure counting series, $a(t)$ as $ a(t)=sum_(i>=0)a_i t^i, $ where $a_i$ is the number of figures with weight $i$.

The *Polya enumeration theorem* states that $ b(t)=Z_G (a(t),a(t^2),...,a(t^n)) $

This boils down to showing that $ b_j=[t^j][1/abs(G)sum_(g in G)a(t)^(c_1 (g))a(t^2)^(c_2 (g))...a(t^n)^(c_n (g))] $ 

Let $"fix"_j (g)$ be defined as the number of elements of $Phi^n$ which have total weight $j$ and are fixed by $g$. Applying Burnside's lemma on the action of $G$ on ${a in Phi^n : w'(a)=j}$, we get that $ b_j=1/abs(G)sum_(g in G)"fix"_j (g). $

Therefore, our goal simplifies down to showing that $ forall g in G,"fix"_j (g)=[t^j](a(t)^(c_1 (g))a(t^2)^(c_2 (g))...a(t^n)^(c_n (g))) $

Now, observe that for an $n$-tuple to be fixed by $g$, #pnote[every cycle that appears in the disjoint cycle decomposition of $g$ has to choose a figure]. And if a cycle of length $k$ choses a figure, then it contributes $k$ times the figure's weight to the total weight of the $n$-tuple. This is exactly what the above equation says, and so we are done.