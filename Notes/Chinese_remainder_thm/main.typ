#import "../math_template.typ" : *

#show : start.with(
  title   : "Chinese Remainder Theorem",
  author  : "Soham Saha"
)

Given integers $m, n$, the Chinese Remainder Theorem states that the following are equivalent:
- $gcd(m,n)=1$ (i.e., $m$ and $n$ are coprime).
- Given integers $a, b$, there exists exactly one integer $x$ such that $0<=x<m n$, $x equiv a (mod m)$ and $x equiv b (mod n)$.
- $ZZ\/(m n)ZZ$ and  $ZZ\/m ZZ times ZZ\/n ZZ$ are isomorphic as groups. In fact, the homomorphism $f:ZZ\/(m n)ZZ->ZZ\/m ZZ times ZZ\/n ZZ$ induced by the homomorphisms $pi^(m n)_m:ZZ\/(m n)ZZ->ZZ\/m ZZ$ and $pi^(m n)_n:ZZ\/(m n)ZZ->ZZ\/n ZZ$ is an isomorphism.

#notebox[Apparently, we can add a another equivalent statement saying that "$ZZ\/(m n)ZZ$ and  $ZZ\/m ZZ times ZZ\/n ZZ$ are isomorphic as rings", but I have no idea about rings right now, so will wait.]

\

We can visualize $ZZ\/m ZZ times ZZ\/ n ZZ$ as a "discrete" torus, and the homomorphism from $ZZ\/(m n)ZZ$ as a trajectory on the torus. When $m$ and $n$ are coprime, the trajectory hits all points on the discrete torus.

#align(center,image(width:70%,"torus.png"))

See https://www.desmos.com/3d/qol3oxiv9e.