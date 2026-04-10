#import "../math_template.typ" : *

#show : start.with(
  title   : "Normal subgroups",
  author  : "Soham Saha"
)

$N<=G$ is called normal subgroup of $G$, denoted as $N triangle.l.small G$, if and only if (the following are equivalent):

- $forall g in G, g N g^(-1)=N$
- There is some group homomorphism $G->H$ which has $N$ as kernel.
- It "makes sense" to take quotient of $G$ by $N$.
- There is some _congruence relation_ (i.e., an _equivalence relation_ that is compatible with the given algebraic structure (in this case the group structure)) on $G$ such that $N=[i_G]$. (More details in next point).
- $N$ defines a _set_ equivalence on $G$ (defined as $g_1 tilde g_2:= g_1 g_2^(-1) in N$, i.e., $N$ and its cosets form a partition of $G$). For this equivalence relation to support the algebraic structure (and therefore, become a congruence relation), we should also have that "group products done on equivalent elements should yield equivalent results", i.e, $g_1 tilde g_2, h_1 tilde h_2 => g_1h_1 tilde g_2 h_2$.

[Sources: #link("https://en.wikipedia.org/wiki/Normal_subgroup")[Wikipedia], #link("https://math.stackexchange.com/a/776061")[MathStackExchange]]

#divdash

I particularly find the congruence relation idea to be the most intuitive. Let's go through it once more.

I have $N<=G$, which induces a partition of $G$ into $N$ and its right cosets. This partition corresponds to an _equivalence relation_ on $G$, namely $ g_1 tilde g_2 := g_1 g_2^(-1) in N. $

#notebox[
  Observe that if we had taken left cosets instead, then we'd need to use $g_1^(-1)g_2$.
  
  Why is this so? For left cosets, if $g_1$ and $g_2$ belong to the same left coset, then they look like $g n_1$ and $g n_2$, so the thing to consider is $g_1^(-1)g_2$. On the other hand, if $g_1$ and $g_2$ belong to the same right coset, then they look like $n_1 g$ and $n_2 g$, so we should consider $g_1 g_2^(-1)$.
]

Now, we want this to also be a _congruence relation_ (i.e., the equivalence relations should respect the group structure), therefore we want $ g_1 tilde g_2 and h_1 tilde h_2 => g_1 h_1 tilde g_2 h_2. $

#notebox[
  Why have this strange criterion? What we actually want is that the equivalence classes form a group under the induced operation. So, we _want_ to define $[g]*_"new" [h]=[g * h]$, which only makes sense if for any representatives from the 2 equivalence classes, when multiplied together, all the results should lie in the same equivalence class.
]

Let us show that this is equivalent to the first definition for normality of a subgroup. Given $g in G, n in N$, we have $g tilde g$ and $n tilde i_G$, so we get $g n tilde g$, which is the same as $g n g^(-1) in N$. We can use this to prove that $g N g^(-1)$ and $N$ are equal as sets.

Also, suppose $g_1 tilde g_2$ and $h_1 tilde h_2$, so $g_1 g_2^(-1) in N,h_1 h_2^(-1) in N$. Using the first definition, we get $g_1 h_1 h_2^(-1) g_1^(-1) in N$, and right multiplying by $g_1 g_2^(-1)$, we get that $g_1 h_1 h_2^(-1) g_2^(-1) in N$, i.e., $g_1 h_1 tilde g_2 h_2$.

#notebox[
  How does this correspond to how a normal subgroup looks on a Cayley diagram?

  See page 132 of Nathan Carter's _Visual Group Theory_, section 7.3 "Normal Subgroups and Quotients".
]

#divdash

Another perspective, which is just a re-garbled version of the previous perspective:

Suppose $G$ has elements ${g_1,g_2,...}$, and we have $N<=G$. Now each element of $G$ corresponds to a left coset, so we have a set map $G->{g_1N,g_2N,...}$ which maps $g in G$ to $g N$.

It is often the case that two or more elements of $G$ correspond to the _same_ coset. We want to develop the set of left cosets into a group, so we need to define how to "multiply" two left cosets and get a new one. The "multiplication" we want should behave in the following fashion: #indent[
  If $g_1$ produces a coset $L_1$ and $g_2$ produces a coset $L_2$, then the "product" of $L_1$ and $L_2$ should be produced by $g_1 g_2$.
]

#notebox[
  As mentioned in _Artin_ (2.12, pg 67), we can think of product of two left cosets $L_1$ and $L_2$ as the set ${l_1 l_2:l_1 in L_1,l_2 in L_2}$. Normality guarantees that product of $g_1N$ and $g_2N$ in this fashion is equal to $(g_1g_2)N$.
]

However, for that to happen, we need to ensure that: #indent[
  If two elements $g_1$ and $g_1 '$ produce the same left coset, and $g_2$ and $g_2 '$ produce the same left coset, then $g_1 g_2$ and $g_1 ' g_2 '$ should produce the same left coset.
] 

This is exactly the normality condition on $N<=G$.

#notebox[
  Observe that $g_1$ and $g_1 '$ produce the same left coset iff both of them lie in the same left coset. So this is how this perspective links back to the previous one.
] 

#div

#notebox[
  Some other/related nice perspectives:
  - https://math.stackexchange.com/q/1014535
  - https://math.stackexchange.com/q/776039
  - https://math.ucr.edu/home/baez/normal.html
  - https://gowers.wordpress.com/2011/11/20/normal-subgroups-and-quotient-groups/
]

