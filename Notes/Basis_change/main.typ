#import "../math_template.typ" : *

#show : start.with(
  title   : [Changing basis for\ matrices of linear maps],
  author  : "Soham Saha"
)

Take basis ${u_1,u_2,u_3}$ for $RR^3$, and basis ${v_1,v_2}$ for $RR^2$. We shall have the "formal" (because entries are vectors) row matrices $ U&:=mat(u_1,u_2,u_3)\ V&:=mat(v_1,v_2), $ which store the ordered basis data for $RR^3$ and $RR^2$.

Given a map $cal(T) in Hom_RR (RR^3,RR^2)$, suppose the matrix of $cal(T)$ with respect to the basis  $U$ and $V$ looks like $ A =  mat(1,2,3;4,5,6). $ Observe that $ V A=cal(T)(U), \ "where" cal(T)(U):=mat(cal(T)(u_1),cal(T)(u_2),cal(T)(u_3)). $

#underl[Case 1] : Column operations on $A$

#indent[
  Suppose we do the column operation $C_2->C_2+2C_1$ on $A$, which corresponds to multiplying $A$ on the right by $M_1=mat(1,2,;,1,;,,1)$, so we get $ A M_1=mat(1,4,3;4,13,6)="result of doing" C_2->C_2+2C_1 "on" A, $ and $V A=cal(T)(U)$ becomes $ V A M_1=cal(T)(U) M_1=cal(T)(U M_1), "using linearity of" cal(T), $

  which tells us that $A M_1$ is the matrix of $cal(T)$ with respect to the "new basis" $U M_1=mat(u_1,u_2+2u_1,u_3)$ in the domain and same old $V$ in the codomain.
]

#underl[Case 2] : Row operations on $A$

#indent[
  Suppose we do the row operation $R_2 ->R_2 +2 R_1$, which corresponds to multiplying $A$ on the left by $M_2 = mat(1,;2,1)$, so we get $ M_2 A=mat(1,2,3;6,9,12)="result of doing" R_2->R_2+2R_1 "on" A, $ and $V A =cal(T)(U)$ becomes $ (V M_2^(-1))M_2 A = cal(T)(U), $ which tells us that $M_2 A$ is the matrix of $cal(T)$ with respect to the basis $U$ in the domain and basis $V M_2^(-1)=mat(v_1-2 v_2,v_2)$ in the codomain.
]

\

This process helps us keep track of how the basis gets updated as we perform row and column operation on the matrices.

#divdash

Observe that if $D=Q^(-1)A P$, then $ V A=cal(T)(U) "becomes" (V Q)Q^(-1)A P=cal(T)(U P)=> (V Q) D=cal(T)(U P) $

This tells us that $D$ is the matrix of $cal(T)$ under the new basis $U P$ in the domain and $V Q$ is the codomain.
