#import "../math_template.typ" : *

#show : start.with(
  title   : "Understanding the Implicit function theorem",
  author  : "Soham Saha"
)

#notebox[
  This is an attempt at gaining "intuition", an extremely versatile, yet painfully error-prone tool in a mathematician's toolbox.
]

Let us start with a simple example first.

#ibox[Q.][
  You are given the unit $3$-dimensional sphere $x^2+y^2+z^2=1$, and a plane $a x+b y+c z=k$ such that the plane intersects the sphere in a circle $C$. Define $pi_X$ as the projection map from $RR^3$ to the $X$-axis. Given a point $p in C$, what minimal constraints do you need to guarantee the existence of an open set $U$ around $p$ such that points in $pi_X (U)$ uniquely correspond to points in $U inter C$ (i.e., the map $pi_X$ from $U inter C$ to $pi_X (U)$ will be a bijection)? 
]

#ibox[A.][
  
  Observe that whenever the plane is perpendicular to the $X$-axis, there can exist no such $U$.

  When the plane is inclined with respect to the $X$-axis, there are exactly two points where an open set $U$ as described above cannot exist, namely the points which have the minimum and maximum possible $X$-coordinate (in $C$) respectively.

  For all other points apart from these two points, we can get such an open set $U$ as specified in the question.
]

#div

Let us analyze what is happening in the example above a bit  further, setting up the scene for generalization.

#indent[
  Let us call the points in $C$ as "good", and points outside $C$ as "bad". We are testing a certain nice property of the intersection of the zero-locus of $x^2+y^2+z^2-1$ and $a x+b y+c z-k$ at the point $p$.

  Let us define $f:=(x,y,z)|->(x^2+y^2+z^2-1,a x+b y+c z-k)$ as the "goodness" function; since a point $q$ is good $<=> f(q)=0 <=> norm(f(q))=0$, and _crucially_, points with lower $norm(f(q))$ are "closer" to good points than points with higher $norm(f(q))$.

  The key observation now is that $det(D f_(y,z) (p))$ is the measure of how fast points around $p$ (in ${p_X} times RR^2$) go bad. Since $p$ was good to start with, $det(D f_(y,z) (p))$ being $0$ would imply a high concentration of good points nearby (either on the plane ${p_X} times RR^2$ itself, or very close to that plane), suggesting that the local uniqueness property may not be satisfied.

  #notebox[
    Observe that this is only a "suggestion", in the sense that it is possible to have $det(D f_(y,z) (p))=0$ and yet satisfy the locally unique property. Think of $f:=(x,y,z)|->(y^3-x,z)$ at $(0,0,0)$.

    So the determinant of $det(D f_(y,z) (p))=0$ *doesn't* guarantee that the zero-locus is not locally like a graph at near $p$; it may or may not be so. 
    
    It _may_ be the case that when $det(D f_(y,z) (p))=0$ and yet the zero-locus is locally like a graph near $p$, the graph would not be of a $C^1$ function. However, I am not entirely sure about this.
  ]

  On the other hand, $det(D f_(y,z) (p))!=0$ implies a rapid change in goodness around $p$ in ${p_X} times RR^2$, and guarantees that the local uniqueness property stated in the question is being satisfied. Therefore, we focus on the non-singularity of the rightmost square block in $D f(p)$, that is, the non-singularity of $(D f_(y,z) (p))$.
]

#notebox[
  Note that the "goodness" function $f$ is just a book-keeping function for what constraints we are trying to solve for. It being $C^1$ tells us that the constraints we are dealing with are nice and smooth, and its rate of change locally around a point (i.e., the determinant of its derivative) describes the rate of change of "goodness" around that point.
]

#div

Now, let us try to generalize these thoughts.

#ibox[Q.][
  Suppose we have $n+m$ variables, conveniently named $x_1,...,x_n,y_1,...,y_m$ (we shall abbreviate them as $x,y$), and $m$ constraints on them, namely $f_1(x,y)=...=f_m (x,y)=0$. Assume that all $f_i$ are continuously differentiable. Let us call $C subset.eq RR^(n+m)$ the set of points in $RR^(n+m)$ which satisfy the constraints. Define $pi:RR^(n+m)->RR^n$ as the projection map onto the first $n$ coordinates.

  Assume that we have $(a,b)$ such that the above constraints are satisfied by $x=a,y=b$. What minimal conditions do we need to guarantee the existence of an open set $U$ around $(a,b)$ in $RR^(n+m)$ such that points in $U inter C$ have their last $m$ coordinates uniquely determined by their first $n$ coordinates (i.e., the map $pi$ from $U inter C$ to $pi (U)$ will be a bijection)?
]

#ibox[A.][
  As before, we define the "goodness" function as $f=(f_1,...,f_m)$. The local uniqueness property is implied by a high rate of change of "goodness" of points close enough to $(a,b)$ in ${a} times RR^m$; which in turn is implied by $det(D_y f (a,b))!=0$, where we are considering the partial Jacobian obtained by differentiating only along the last $m$ coordinates.

  So, when $det(D_y f (a,b))$ is non-zero (which corresponds to the right-most $m times m$ submatrix of $D f (a,b)$ being non-singular), we can get an open neighborhood $U$ around $(a,b)$ such that for every $x in pi(U)$, we can uniquely solve for $y$ such that $(x,y)$ is satisfies the constraints.

  Therefore, $det(D f_y (a,b))!=0$ is a sufficient condition for the existence of open set $U$ as described above, but it is not a necessary condition in general.
]

#div

Now, to put the final nail in the coffin, let us have a look at what Wikipedia gives us as intuition for the implicit function theorem:

#indent[
  _Under a mild condition on the partial derivatives, the set of zeros of a system of equations is locally the graph of a function._
]

Unpacking the Wikipedian sentiment,

#indent[
  Given a system of equations $f_1(x,y)=...=f_m (x,y)=0$ on variables $x_1,...,x_n,y_1,...,y_m$, the set $C subset.eq RR^(n+m)$ of solutions to those constraints and $(p,q) in C$,
  - The "mild condition on partial derivatives" is that the right-most $m times m$ submatrix of $D f (p,q)$ is invertible. 
  - If that is the case, then we get that there exists an open neighborhood $U$ around $(p,q)$ such that $ exists g,U inter C={(x,g(x)):x in pi(U)}, $ therefore showing that $C$ is locally the graph of $g$ at the value $p$.
]

A cleaner formulation, with a few added details would be:

#rect(width:100%)[
  Given a $C^1$ function $f: RR^(n+m)->RR^m$, $f(a,b)=0$ and the partial Jacobian $D_y f(a,b)$ invertible, there exist open sets $U in.rev a,V in.rev b$ and a $C^1$ function $g :U->V$ such that $ {(x,y) in U times V : f(x,y)=0}={(x,g(x)):x in U} $

  Moreover, $g$ would be a $C^1$ function, and we would have $ forall x in U, g'(x)=-(D_y f (x,g(x)))^(-1)D_x f(x,g(x)) $  
]

#notebox[
  The above claim can be proved by applying the inverse function theorem on the function $ F:RR^(n+m)->RR^(m+n):=(x,y)|->(x,f(x,y)) $ at the point $(a,b)$. But that is a story for another day...
]

#divdash

References:

- https://en.wikipedia.org/wiki/Implicit_function_theorem : Mainly the introduction, _Definition_ and the _Statement of Theorem_ sections.
- https://en.wikipedia.org/wiki/Inverse_function_theorem#Implicit_function_theorem