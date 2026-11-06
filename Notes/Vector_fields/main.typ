#import "../math_template.typ" : *

#show : start.with(
  title   : "Vector fields",
  author  : "Soham Saha"
)

#let Der = $"Der"$

Given an open set $U subset.eq RR^n$, a *vector field* $X$ over $U$ is an object of type $ X ::(p:U)->T_p (U) $

#notebox[
  So a given vector field associates, for every point $p in U$, a vector with its tail at $p$.
]

#notebox[
  Recall the isomorphism $T_p (U) isom RR^n isom cal(D)(C_p^oo)$.

  So, we can take basis for $T_p (U)$ as ${e_1,...,e_n}$ (which is actually a basis for $RR^n$), and ${lr(del/(del x_1)|)_p,...,lr(del/(del x_n)|)_p}$ for $cal(D)(C_p^oo)$. So, we can write the $3$-dimensional vector field $X_p:=mat(p_x,0,-p_y^2)^T$ as $ (p_x,p_y,p_z)|-> p_x lr(del/(del x)|)_p-p_y^2 lr(del/(del z)|)_p $

  \

  Given a vector field $X$, for example $X_p := p_x lr(del/(del x)|)_p-p^2_y lr(del/(del z)|)_p$, and $f in C^oo (U)$, we can define $ (X f)_p=p_x lr((del f)/(del x)|)_p-p^2_y lr((del f)/(del z)|)_p $

  Observe that $X f$ is a function from $U$ to $RR$. If $X$ is a $C^oo$-smooth vector field, then $X f$ will be in $C^oo (U)$, so let us first define what a $C^oo$-smooth vector field means.

  #div

  Recall that the isomorphism $T_p (U) -->^~ cal(D)(C_p ^oo)$ converts a vector $v$ based at $p$ into the action of taking the directional derivative of a given function at $p$ along $v$.

  So given a vector field $X$, the above isomorphism converts $X_p$ from being a vector in $T_p (U)$ to being the action of taking directional derivative at $p$ along $X_p$.
]

\

Given a vector field $X$ on $U subset.eq RR^n$, we can define the "component functions" of $X$ as ${pi_i compose X}_(1<=i<=n)$, where $pi_i$ projects $T_p (U)$ onto the basis vector $e_i$ (or equivalently, projects $cal(D)(C_p^oo)$ onto the basis vector $lr(del/(del x_i)|)_p$).

A vector field $X$ is called *$C^oo$-smooth* if all of the component functions are smooth. This implies that every smooth vector field $X$ can be expressed as $ X_p=sum_(i=1)^n f_i (p)lr(del/(del x_i)|)_p, "for some" f_i in C^oo (U). $

We denote by *$cal(X)(U)$ the space of all smooth vector fields over $U$*. The above statement therefore becomes that $ cal(X)(U) isom ldsum_(i=1)^n [C^oo (U) del/(del x_i)] $

#notebox[
  This makes $cal(X)(U)$ into a $C^oo (U)$-module!
]

From now onwards, we shall assume that our vector fields are $C^oo$-smooth unless otherwise stated.

#divdash

Let us revisit $f |-> X f$, where $X in cal(X)(U), f in C^oo (U)$.

Thinking of $cal(X)(U)$ as $(p:U)->cal(D)(C^oo_p)$, the above map simply becomes $ X f:= [(p:U)|-> X_p (f)] $

Since $X$ is $C^oo$-smooth, so let $X_p=sum a_i (p) lr(del/(del x_i)|)_p$ for some $a_i in C^oo (U)$. Therefore, $ (X f)_p= sum a_i (p) (del f(p))/(del x_i) in C^oo (U) $

#notebox[
  Therefore, observe that $Phi_X:=f |-> X f$ is a map from $C^oo (U)->C^oo (U)$ which has the following properties:
  - It is $RR$-linear
  - It satisfies the Leibniz rule, $Phi_X (f g)=f Phi_X (g)+g Phi_X (f)$, because $ (X(f g))_p&=sum a_i (p) (del(f g)(p))/(del x_i)\ &= sum a_i (p)[f(p)(del g(p))/(del x_i)+g(p)(del f (p))/(del x_i)]\ &= f(p)(X g)_p+g(p)(X f)_p $

  \

  A $C^oo (U)$ to $C^oo (U)$ function which is $RR$-linear and satisfies the Leibniz rule is called a *derivation of $C^oo (U)$*. We denote the set of all derivations of $C^oo (U)$ as $Der(C^oo (U),C^oo (U))$.

  Note that this is _different_ from a point derivation of $C_p^oo$ at $p$, which we have denoted as $cal(D)(C_p^oo)$ previously.
]

#let grad = $"grad"$
#let div = $"div"$
#let curl = $"curl"$

#notebox[
  What does $X f$ "actually" represent?

  #underl[View \#1]#indent[
    $X$ assigns to every point $p in U$ the vector $X_p in T_p (U)$. But, we have seen in the previous part that every vector corresponds to the point derivation given by taking the directional derivative at that point.

    Therefore, we can think of $X_p$ as the action of taking the directional derivative of a given function at the point $p$ along the vector $X_p$.

    Given a function $f in C^oo (U)$, $(X f)_p$ is the directional derivative of $f$ along $X_p$.
  ]

  #underl[View \#2]#indent[
    Given the smooth $2$-dimensional vector field $X=mat(-y,x^2)^T$, we can also write it as $X=-y del/(del x)+x^2 del/(del y)$.

    Now, given $f in C^oo (U)$, we have defined $X f in C^oo (U)$ as $ (X f)_p := -p_y lr((del f)/(del x)|)_p+p_x^2 lr((del f)/(del y)|)_p $

    So, at a point $p in U$, $(X f)_p$ is the dot product of the vector field at that point with the gradient of $f$ at that point. Basically, it expressed how "aligned" the vector field is with the direction of steepest ascent of $f$.

    In the next section, we shall see the definition of $grad$ and others.
  ]
]

#divdash

Let us discuss about $grad,curl$ and $div$. $U_n$ denotes an arbitrary open subset of $RR^n$.

#underl[Gradient ($grad$)]#indent[
  Given a scalar function $f in C^oo (U_n)$, we can define a vector field $ grad(f) in cal(X)(U_n)\ grad(f)_p:=mat((del f(p))/(del x_1),...,(del f(p))/(del x_n))^T $

  #notebox[
    $grad(f)_p$ measures the direction and magnitude of the steepest ascent of $f$ at the point $p$.
  ]
]

#underl[Curl ($curl$)]#indent[
  Curl is conventionally defined over $2$-dimensional and $3$-dimensional vector fields. We shall denote them respectively by $curl_2$ and $curl_3$.

  $curl_3$ takes in a $3$-dimensional vector field and produces another $3$-dimensional vector field. Given a vector field $X=f_x del/(del x)+f_y del/(del y)+f_z del/(del z) in cal(X)(U_3)$, we define $ curl_3(X) in cal(X)(U_3)\ curl_3(X)_p=det(mat(hat(i),hat(j),hat(k);lr(del/(del x)|)_p,lr(del/(del y)|)_p,lr(del/(del z)|)_p;f_x,f_y,f_z)) $

  #notebox[
    Given a point $p in U_3$, suppose we take a very small ball (_not_ a point; a ball) and anchor its origin at $p$.

    Informally speaking, the "flow" of the vector field $X$ around $p$ will make the ball start spinning about some axis with some rotational velocity. $curl_3(X)_p$ points along the axis of rotation with the rotational velocity as its magnitude.
  ]

  $curl_2$ takes in a $2$-dimensional vector field $X=f_x del/(del x)+f_y del/(del y) in cal(X)(U_2)$ and produces a $C^oo (U_2)$ function, $ curl_2(X) in C^oo (U_2)\ curl_2 (X)=det(mat(lr(del/(del x)|)_p,lr(del/(del y)|)_p;f_x,f_y)) $

  #notebox[
    A certain physics person once told me that $curl$ is inherently a $3$-dimensional concept. In fact, we can use the same idea as above, but we must first "think of" $X$ as a $3$-dimensional vector  field, $ X'=f_x del/(del x)+f_y del/(del y)+0 del/(del z) $

    If we take $curl_3 (X')_p$, then it will only have a component along $hat(k)$, and the coordinate along $hat(k)$ is the value we give to $curl_2 (X)_p$.

    So first we immerse our given vector  field in $3$d, and then we repeat our ball visualization. Now the axis of rotation of the ball will always be parallel to the $Z$-axis, so we can get away with just storing the "magnitude" of rotation.
  ]

  From here onwards, we will just write $curl$ instead of distinguishing between $curl_2$ and $curl_3$, leaving it up to the reader to determine it from context.
]

#underl[Divergence ($div$)]#indent[
  Given an $n$-dimensional vector field $X=f_x_1 del/(del x_1)+...+f_x_n del/(del x_n) in cal(X)(U_n)$, its "divergence" is a $C^oo (U)$ function defined as $ div(X) in C^oo (U)\ div(X)_p = (del f_x_1(p))/(del x_1)+...+(del f_x_n (p))/(del x_n) $

  #notebox[
    Informally speaking, $div(X)_p$ measures the extend to which the vector field $X$ acts like a source or sink near the point $p$.
  ]
]

\

This may all seem like very disparate concepts, but we will soon see how $grad, curl$ and $div$ are just incarnations of the standard exterior derivative.

#divdash