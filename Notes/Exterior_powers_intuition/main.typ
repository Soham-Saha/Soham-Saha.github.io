#import "../math_template.typ" : *

#show : start.with(
  title   : [Building intuition about exterior powers],
  author  : "Soham Saha"
)

#notebox[
  Stop. Pause. Breathe.

  Ask yourself: #indent[Why are we dealing with alternating multilinear maps in the first place? Why are they so special?]
]

In the previous notes we have defined alternating multilinear maps as those maps which respect a certain action of $S_n$ (i.e., they respect a certain symmetry in the domain).

From there we defined $Lm^n (V)$ as the largest quotient space on which any linear map corresponds to an alternating multilinear map on $underbrace((V,...,V),n)$.

Now, let us look at it in the *reverse direction*. We know that alternating maps can't distinguish between two inputs if they project onto the same wedge product in $Lm^n (V)$. So, hopefully, figuring out when two inputs have the same wedge product should give us some idea about alternating maps.

\

#ibox[Q.][
  For some $1<=k<=n$, given two $k$ sized sets of linearly independent vectors in $RR^n$, when do the have the same wedge product? That is, given independent sets ${x_1,...,x_k} subset.eq RR^n$ and ${y_1,...,y_k} subset.eq RR^n$, when do we have $ x_1 and ... and x_k=y_1 and ... and y_k? $
]

#ibox[A.][
  Since $x_1,...,x_k$ are all linearly independent, so we can find vectors $x_(k+1),...,x_n$ such that $(x_1,...,x_n)$ forms a basis for $RR^n$.

  So we have a full-rank matrix $A_(n times k)$ such that $ mat(x_1,...,x_n)A=mat(y_1,...,y_k) $

  Recall that ${x_i_1 and ... and x_i_k : 1<=i_1<...<i_k<=n}$ is a basis for $Lm^k (RR^n)$. The coordinate of $y_1 and ... and y_k$ along $x_i_1 and ... and x_i_k$ is the $k times k$ minor of $A$ on the rows $i_1,...,i_k$ and across all the columns.

  Since $y_1 and ... and y_k$ only has coordinate along the basis vector $x_1 and ... and x_k$, so only the top $k times k$ minor of $A$ is non-zero, all others $k times k$ minors are zero. Therefore, the top $k$-many rows of $A$ are linearly independent. Every other row must be $0$, or else we can swap one of the top $k$-many rows with this row to produce another $k$-sized set of rows which are linearly independent, which is a contradiction.

  Since all the rows of $A$ except the top $k$ rows are zero, so define $A'$ as the top $k times k$ submatrix of $A$. We have that $ mat(x_1,...,x_k)A'=mat(y_1,...,y_k), $ and $det(A')=1$.

  
  Therefore, $y_1,...,y_k$ are in the span of $x_1,...,x_k$. Since $y_1,...,y_k$ are linearly independent, so we get that $ "span"({x_1,...,x_k})="span"({y_1,...,y_k}). $

  In fact, this is a characterization of the wedge products being same. #notebox[
    So, we get that given linearly independent sets ${x_1,...,x_k},{y_1,...,y_k} subset.eq RR^n$, $ x_1 and ... and x_k=y_1 and ... and y_k <=> \ exists A_(k times k) "s.t." det(A)=1 "and" mat(x_1,...,x_k)A=mat(y_1,...,y_k). $

    Observe that the existence of such a matrix $A$ implies that $"span"({x_1,...,x_k})="span"({y_1,...,y_k})$.
  ]
]

\

Assume $1<=k<=n$. We get some _very_ interesting things from the above characterization:
- Every non-zero simple $k$-vector $v_1 and ... and v_k in Lm^k (RR^n)$ describes the equivalence class of all $k$-dimensional parallelepipeds living in $"span"({v_1,...,v_k})$ and having the same signed $k$-volume as the oriented parallelepiped spanned by $(v_1,...,v_k)$.
- The $k$-fold input to an alternating multilinear map can be thought of as a $k$-dimensional parallelepiped in $RR^n$. Therefore, elements of $Hom_RR (Lm^k (RR^n),V)$ are linear maps which cannot distinguish between two $k$-dimensional parallelepipeds which share the same span and have the same oriented volume.
- A map $L in Hom_RR (Lm^2 (RR^3),V)$ is uniquely determined by what it does to the parallelograms $e_1 and e_2,e_2 and e_3,e_1 and e_3$, since every $2$-dimensional parallelogram in $RR^3$ can be expressed as a linear combination of these $3$ parallelograms.

#divdash

Let us try to intuitively analyze $phi in Hom_RR (Lm^k (RR^n),V)$, where $V$ is some arbitrary vector space.

$phi$ is uniquely determined by what it does to the "principal" $k$-parallelepipeds, namely ${e_i_1 and ... and e_i_k:1<=i_1<...<i_k<=n}$. Observe that all of the principal $k$-parallelepipeds have absolute $k$-volume $=1$.

Instead of dealing with abstract $k,n$, let us consider $phi in Hom_RR (Lm^2 (RR^3),V)$, the case of parallelograms in $RR^3$. $phi$ is uniquely determined by the vectors (in $V$) it associates to the principal $k$-parallelepipeds $e_1 and e_2,e_2 and e_3,e_1 and e_3$.

Given vectors $u=(u_1,u_2,u_3),v=(v_1,v_2,v_3) in RR^3$, the parallelogram $chevron.l u,v chevron.r$ casts shadows on the `XY`-,`YZ`- and `XZ`-planes. Now,
- We look at the first shadow, $chevron.l (u_1,u_2),(v_1,v_2) chevron.r$ and check if it has the same orientation as $chevron.l e_1, e_2 chevron.r$.
- We calculate the (unsigned) area of $chevron.l (u_1,u_2),(v_1,v_2) chevron.r$, and multiply it by $phi(e_1 and e_2)$. If $chevron.l (u_1,u_2),(v_1,v_2) chevron.r$ and $chevron.l e_1,e_2 chevron.r$ have different orientation, then we multiply by a further $-1$, otherwise we leave the product alone.
- We do the same for the other shadows and add all of the results together. This is the value of $phi(u and v)$.

Observe that the above calculation matches with $ phi(u and v)=phi((u_1 e_1 +u_2 e_2 +u_3 e_3) and (v_1 e_1 +v_2 e_2+v_3e_3))=... $

Therefore $phi in Hom_RR (Lm^k (RR^n),V)$ is uniquely determined by the vectors (in $V$) it assigns to unit $k$-volume parallelepipeds in every principal $k$-plane.

#divdash

We are mostly interested in the case when $V=RR$, i.e., $phi in Hom_RR (Lm^k (RR^n),RR) isom Lm^k (RR^n)^*$. From the above discussion we get that:

- Every $phi in Hom_RR (Lm^k (RR^n),RR)$ is uniquely determined by the *weight it assigns to projection onto every principal $k$-plane*, the plane spanned by $k$-many basis vectors.
- For example, for some $phi in Hom_RR (Lm^2(RR^3),RR)$, $phi$ associates the `XY`-, `YZ`- and the `XZ`-shadows with *weights*, and everything else about $phi$ is uniquely determined from there.

#notebox[
  Therefore, every element $phi in Lm^k (RR^n)^*$ carries exactly the data of what weight it assigns to shadows onto each of the principal $k$-dimensional planes.

  \

  Playing around with the ideas developed above, we get that:

  #rect(width:100%)[
    Every $phi in Lm^k (RR^n)^*$ is a "coherent" way of mapping $k$-dimensional parallelepipeds in $RR^n$ to scalars, where "coherent" implies:
    - $phi$ should respect taking sum (as $k$-vectors) of two $k$-parallelepipeds, whenever the sum is again a simple $k$-vector.
    - For two $k$-parallelepipeds which have the same span in $RR^n$, if $ "absolute-"k"-Volume"(A)=r dot "absolute-"k"-Volume"(B) $ for some $r in RR_(>=0)$, then $ phi(A)=cases(&r phi(B) "if" A "and" B "have same orientation",-&r phi(B) "otherwise") $
  ]

  Note that $k$-vectors refer to elements of $Lm^k (RR^n)$, and simple $k$-vectors are those which can be written as $v_1 and ... and v_k$ for some $v_i in RR^n$.

  This is the *intuitive view* of $Lm^k (RR^n)^*$ which I had been looking for. This will provide us with the much needed bridge to get to differential forms.
]

#divdash

Using all that we have seen above, every $phi in Lm^n (RR^n)^*$ is uniquely determined by where it sends $e_1 and ... and e_n$, i.e., $phi$ is uniquely determined by what scalar it assigns to unit volume $n$-parallelepipeds in $RR^n$.

When we choose to assign $1 in RR$ to unit volume $n$-parallelepipeds in $RR^n$, we get $det_n in Lm^n (RR^n)^*$.

#divdash