#import "../math_template.typ" : *

#show : start.with(
  title   : [Dealing with DFAs through actions],
  author  : "Soham Saha"
)

#let deltah = $hat(delta)$

Consider the following question:

#indent[
  Given that $L$ is regular, show that $"sqrt"(L):={x in Sigma^* : x^2 in L}$ is regular.
]

For this question, suppose we have a complete DFA, $cal(A) =chevron.l Sigma, Q, delta, q_0, F chevron.r$.

#notebox[
  Note that $deltah(w,-)$ is the same as $deltah(w)$, the first one just assumes that we are working with the uncurried version of $deltah$.

  Note that $deltah(w)$ is of type $Q^Q$, when $w in Sigma^*$.
]

One solution is to consider the set of states $Q^3$, mark ${(q_0,a,a):a in Q}$ as initial, and set up transitions so that when we are done reading $w$ starting from any initial state $(q_0,a,a)$, we end up at $(deltah(w,q_0),a,deltah(w,a))$. We mark ${(x,x,y):x,y in Q}$ as accept states.

The idea can be modified slightly by also remembering where the first word reading started from, which is always $q_0$. So now, states are $Q^4$, initial are ${(q_0,q_0,a,a) : a in Q}$, transitions set up such that reading $w$ from some initial $(q_0,q_0,a,a)$ leads us to $(q_0,deltah(w,q_0),a,deltah(w,a))$ and ${(q_0,x,x,y):x,y in Q}$ are accept states.

\

We can _very_ easily extend this idea to $"cbrt"(L) :={x in Sigma^*:x^3 in L}$ by considering $Q^6$ and transitions which map $(x,x,y,y,z,z)$ to $(x,deltah(w,x),y,deltah(w,y),z,deltah(w,z))$.

\

So basically we are storing the graph of the function $deltah(w)$ on $n$ many states when we want to take the $n^"th"$ root. Observe that $ deltah:Sigma^*->Q^Q $ is a monoid homomorphism, so $deltah$ is the action of the free monoid $Sigma^*$ on the set $Q$, and $deltah(w)$ can be interpreted as the action of $w$ on $Q$.

\

So why should we stick to just storing the action data for $n$ many states? Why not just do it for all states?

So, in general, we can set up a DFA such that the states are $Q^Q$, the initial state as $id : Q^Q$, and transitions such that on reading the word $w$ starting from $id$ we reach $deltah(w)$. We are compressing down the (infinite) data set of all words $w in Sigma^*$ to the finite set of their actions on $Q$.

\

An example of this idea being used in the wild is given below in the `squash` example.

#div

#align(image("squash.png", width: 70%), center)

Recall the `squash` question above from Quiz 1.

Suppose $cal(A)_L=chevron.l Sigma,Q,delta,q_0,F chevron.r$ is a complete DFA which accepts $L$.

#notebox[
  Note that $deltah:Sigma^*->Q->Q$, so $deltah(w)$
]

The idea is that as we read $x in Sigma^*$, we will be storing all possible splittings of it as $(u,v)$ where $x  = u v$. But because we cannot store infinitary data (infinitary in the sense that we cannot store for _all_ $x in Sigma^*$), and here anyway we don't _need_ the data of the word itself, we will be storing ${(deltah(u),deltah(v)):u, v in Sigma^* "s.t." x = u v}$. Observe that we will accept $x$ whenever there are $u,v in Sigma^*$ such that $u v =x$ and $[exists w in K "s.t." (deltah(v) compose deltah(w) compose deltah(u))(q_0) in F]$.

\

So, to design a DFA for `squash(L,K)`, we set

- States $:= cal(P)(Q^Q times Q^Q)$
- Transition $:= $ On reading $a in Sigma$, transition from $S in cal(P)(Q^Q times Q^Q)$ to $ {(f, delta(a) compose g):(f,g in S)} union {(delta(a) compose g compose f, id):(f,g) in S} $
- Initial state $:= {(id,id)}$
- Final states $:=$ $ S in cal(P)(Q^Q times Q^Q) "is final" <=> {(f,g) :exists w in K "s.t" (g compose deltah(w) compose f)(q_0) in F} inter S != phi $

The semantics that we are targeting here is that on reading the word $x in Sigma^*$ starting from ${(id,id)}$, we end up at the set ${(deltah(u),deltah(v)):u v = x}$.

This DFA accepts `squash(L,K)`.

#notebox[
  Note that we never used that $K$ is regular. We would need that $K$ is regular to actually construct a DFA, the above only shows the existence of a DFA.
]

#notebox[
  But, observe that the accept condition is _non-algorithmic_, in the sense that given $S in P(Q^Q times Q^Q)$, we cannot easily decide whether $S$ should be an accept state or not, using the above definition of final states. Can we somehow make this constructive?

  #divdash

  If we can constructively produce the finite set ${deltah(w):w in K}$ then we would have an algorithm to check whether $S in cal(P)(Q^Q times Q^Q)$ should be accepting or not.

  We already have the DFA $cal(A)_L=chevron.l Sigma,Q_L,delta_L,q_0_L,F_L chevron.r$ for $L$.

  Suppose $K$ is accepted by $cal(A)_K=chevron.l Sigma, Q_K, delta_K, q_0_K,F_K chevron.r$.

  Consider the directed graph on $Q_L^(Q_L) times Q_K$, where edges are $ E:={(f,x),(delta_L (a) compose f,delta_K (a,x)):a in Sigma} $

  Observe that for arbitrary $S in Q^Q$, $ S in {deltah_L (w):w in K}<=>exists k in F_K "s.t." (S,k) "is reachable from" (id,q_0_K) $
  
  This gives an algorithm for constructing ${deltah_L (w) : w in K}$.
]

#notebox[
  One of the key ideas behind this solution style is the observation that $ a_1 a_2...a_k in L <=> (deltah(a_k) compose deltah(a_(k-1)) compose ... compose deltah(a_1))(q_0) in F $

  whenever $L$ is regular and has complete DFA $chevron.l Sigma, Q, delta,q_0,F chevron.r$.

  So, we don't have to carry around the data of $a_1 a_2...a_k$ as we traverse the DFA we are going to make, it is enough to just store their actions.
]