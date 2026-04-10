#import "../math_template.typ" : *

#show : start.with(
  title   : [Group actions],
  author  : "Soham Saha"
)

#notebox[
  - Given a group $G$ and a set $X$, homomorphisms from $G$ to $"Sym"(X)$ are called group actions, and $phi in "Hom"(G, "Sym"(X))$ is an action of $G$ on $X$.
  - Given $x in X$, the stabilizer of $x$, denoted $G_x$ or $"Stab"(x)$ is defined as $ G_x="Stab"(x)={g : (phi(g))(x)=x} $ 
  
    Intersection of all stabilizers is exactly the kernel of the group action, $ inter.big_(x in X) G_x=ker(phi)=phi^(-1)(id) $

    All stabilizers are (not necessarily normal) subgroups of $G$, and therefore $forall x, abs("Stab"(x))$ divides $abs(G)$.
  - Given $x in X$, the orbit of $x$, denoted $O_x$ is defined as $ O_x={(phi(g))(x):g in G} $
    Orbits are not necessarily of same cardinality, they just partition $X$.
  - For a general action $phi : G->"Sym"(X)$, the class equation is $ X&=product.co_(Omega in {O_x:x in X})Omega, $ which just tells that the orbits partition $X$. If we classify by whether orbit size is equal to $1$ or not, $ abs(X)=&abs({x: abs(O_x)=1})+sum_(Omega in {O_x : x in X}\ abs(Omega)!=1) abs(Omega)\ =& "number of fixed points"+\ &"total length of non-trivial orbits" $
    Class equation is all about partitioning the set into orbits. 
]

#notebox[
  - Think of the symmetry group of a tetrahedron acting on its set of vertices or, equivalently, $S_4$ acting on itself by left multiplication. This will give intuition for the bijection defined below. Also have a look at https://en.wikipedia.org/wiki/Group_action#Orbits_and_stabilizers. 
  - Given $x in X$, we can define a set bijection ($G\/G_x$ is the set of left cosets) : $ f : G\/G_x->O_x \ g G_x|->(phi(g))(x). $ Each coset has a fixed place where it sends $x$ to; $f$ applied to a coset tells us what that place is.
  - This gives us the orbit-stabilizer theorem, $ abs(G_x)abs(O_x)=abs(G) $
    Since $abs(G_x)$ divides $abs(G)$, so $abs(O_x)$ also divides $abs(G)$.
]

#notebox[
  - If we have $"Inn"(G):={(x|->g x g^(-1)):g in G}$, $"Aut(G)"=$ isomorphisms on $G$, and $"Sym"(G)=S_ord(G)=$ group of all set theoretic permutations on $G$, then $ "Inn"(G) normal "Aut"(G) <= "Sym"(G) $
  - Centralizers and conjugacy classes arise from the action of $G$ on its own underlying set by conjugation. This action is defined as $phi_"conj" : G-> "Sym"(G):=g |->(x|->g x g^(-1))$.
  - Given $x in G$, the $x$-stabilizer of this action is called the centralizer of $x$, or $Z(x)$ for short. Therefore, $ Z(x)={g : g x g^(-1)=x}. $ Alternatively $Z(x)$ can be thought of as the set of all $g in G$ which commute which $x$. 
  - Intersecting all the centralizers, we get the center of $G$, which is called $Z(G)$. These are the elements in $G$ which commute with everyone in $G$. In the previous section we saw that the intersection of all stabilizers is the kernel of the action, which fits nicely here, since $phi_"conj"^(-1)(id)=Z(G)$. Since, $Z(G)$ is the kernel of $phi$, so $Z(G) normal G$.
  - Repeating from previous point: #pnote[$ ker(phi_"conj")=Z(G)\ G\/Z(G) isom im(phi_"conj")="Inn"(G)<="Sym"(G) $]
  - For all $x in.not Z(G)$ (non-central elements), $Z(x)$ properly contains $Z(G)$, since $Z(G) subset.eq Z(x)$ and $x in Z(G)\\Z(x)$.
  - Given $x in G$, the orbit of $x$ with respect to the conjugation action is called the conjugacy class of $x$. It is represented as $C(x)$ or $C_G (x)$. These are all the elements which can be reached by conjugating $x$ with different things. $ C(x)={g x g^(-1): g in G} $ The order of $C(x)$ roughly tells about the "non-commutativity" of $x$, the higher the order, the less commutative $x$ is. 
  - Elements of $Z(G)$ are precisely those which have singleton conjugacy classes.
  - $abs(Z(x)), abs(C(x)), abs(Z(G))$ all divide $abs(G)$. This is because $Z(x) <= G$ and $Z(G) normal G$; and we also have $abs(Z(x))abs(C(x))=abs(G)$ by the orbit-stabilizer theorem.
  - The class equation for this specific action tells us that $ G&=Z(G) union.sq (product.co_(Omega in {C(x):x in G}\ abs(Omega)!=1) Omega)\ => abs(G) &= abs(Z(G))+sum_(Omega in {C(x):x in G}\ abs(Omega)!=1) abs(Omega) $
    Remember that #pnote[class equation is all about partitioning the set into orbits. ]
]

#notebox[
  - Members of the same conjugacy class "behave similarly", meaning that they are equivalent elements in the group up to renaming the elements of the group. If $x,y$ are in the same conjugacy class, then $exists g, g x g^(-1)=y$. $g$ is the renaming operation on $G$; it renames the members of $G$ while preserving all structure of the group.
  - For $H,K <=G$, if $H$, $K$ are conjugate subgroups, then they "look alike" in $G$; they are the same subgroups in $G$ up to renaming.
  - The conjugation $g x g^(-1)$ allows one to perform the "local action" $x$ at a different location, dictated by $g$.

    For example, if $g=(1" "2" "..." "n)$, and $x=(1" "2)$, then $g^n x g^(-n)$ allows us to do the "swap" $x$ at a different place.

  - Normal subgroups are union of conjugacy classes.
]

#notebox[
  
  === Key new ideas:
  #indent[
    - Intersection of all stabilizers is the kernel of the action.
    - Intersection of all centralizers is the center. Therefore, $Z(G)=ker(phi_"conj")$.
    - $G\/Z(G)=G\/ker(phi_"conj")isom im(phi_"conj")="Inn"(G)$.
    - For all $x in.not Z(G)$ (non-central element), $Z(x)$ properly contains $Z(G)$, i.e., $Z(x)  subset.neq Z(G)$. 
    - Normal subgroups are union of conjugacy classes.
    - If there is a single subgroup of a given order, then it is normal; since if we have $H<=G$ then $forall g in G, g H g^(-1)=H$. 
  ]
]

#notebox[
  Given $H<=G$, some interesting group actions to consider are:

  - $G$ acting on itself by left multiplication.
  - $G$ acting on the set of left cosets of $H$ by left multiplication.
  - $H$ acting on the set of left cosets of $H$ by left multiplication.
  - $G$ acting on itself by conjugation.
  - $G$ acting on its sets of subsets by conjugation.
  - $G$ acting on the set of Sylow-$p$ subgroups of $G$ (also called $"Syl"_p (G)$) by conjugation.
  - $H$, a Sylow-$p$ subgroup of $G$ acting on the set of Sylow-$p$ subgroups of $G$ by conjugation.
]

#notebox[
  Suppose $phi:G->"Sym"({H:H<=G})$ is the action of $G$ acting on its own set of subsets by conjugation.

  In this case, for $H <=G$, $ "orbit"(H)= "subgroups in "G" who are conjugate to" H, \ "stab"(H)="normalizer of" H "in" G=N_G (H). $

  Therefore, we have $ N_G (H)={g:g H g^(-1)=H}={g:g H=H g} $

  - Why is it called *normalizer*? Because $N_G (H)$ is the largest subgroup of $G$ in which $H$ is normal.
  - We have $ H normal N_G (H) <=G. $ Therefore, $abs(H)$ divides $abs(N_G (H))$, which further divides $abs(G)$. #h(100%)
  - $abs("orbit"(H)) abs("stab"(H))=abs(G)$. Therefore, we have $ ("number of conjugates of H")times abs(N_G (H))=abs(G). $ This also tells us that $ "number of conjugates of" H=abs(G)/abs(N_G (H))<=abs(G)/abs(H)=[G:H] $
  - By Sylow's 3rd theorem, we know that all Sylow-$p$ subgroups are conjugates to each other. Therefore, $ n_p&="number of Sylow-"p "subgroups"\ &="number of conjugates of some Sylow-"p "subgroup"\ &= abs(G)/abs(N_G (H)), "where" H "is a Sylow-"p "subgroup." $
  - To find out $N_G (H)$, it is enough to consider generators of $H$.
  - The following are equivalent:
    - $H normal G$
    - $abs("orbit"(H))=1$
    - $"orbit"(H)={H}$
    - $N_G (H)=G$.
]