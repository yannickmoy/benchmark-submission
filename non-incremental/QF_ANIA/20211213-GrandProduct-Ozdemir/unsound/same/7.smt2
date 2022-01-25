
(set-info :smt-lib-version 2.6)
(set-logic QF_ANIA)
(set-info :source |
Generated by: Alex Ozdemir
Generated on: 2021-12-13
Generator: Z3Py API
Application: Soundness counterexamples for a cryptographic argument
Target solver: cvc5, Z3

# The special soundness of PLONK's grand product argument

Let F be a prime-order field and n a natural less than F's size. Let n = {1,
2, .., n} be a subset of F. The PLONK[1] grand product argument relies on the
fact that given a permutation pi: [n] -> [n] and functions A, B: [n] -> [n],

    prod_i (A(i) + beta * i + gamma) = prod_i (B(i) + beta * pi(i) + gamma)

holds for random beta, gamma in F with good probability only when A composed
with pi is B.

Does this implication hold in a deterministic setting, where the above is
checked for distinct---but non-random---beta and gamma?

If it is checked for n+1 distinct values of beta, and for each value of beta,
n+1 distinct values of gamma, then yes. One can prove this.

If it is checked for 2 distinct values of beta, and for each value of beta, n+1
distinct values of gamma, then no.

This series of benchmarks checks the implication holds
* for varying n
* for a fixed permutation pi = (2 3 ... n 1)
* for all A and B
  * that must be equal ("same") or may differ ("diff")
* for all distinct 2 ("unsound") or n+1 ("sound") beta values

rather than instantiating gamma explicitly, we just check that the multisets

    {{A[i] + beta * i}}_i  ==  {{B[i] + beta * pi(i)}}_i

are equal.

[1]: https://eprint.iacr.org/2019/953

|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "crafted")
(set-info :status sat)
; benchmark generated from python API
(declare-fun w__0 () Int)
(declare-fun v__0 () Int)
(declare-fun w__1 () Int)
(declare-fun v__1 () Int)
(declare-fun w__2 () Int)
(declare-fun v__2 () Int)
(declare-fun w__3 () Int)
(declare-fun v__3 () Int)
(declare-fun w__4 () Int)
(declare-fun v__4 () Int)
(declare-fun w__5 () Int)
(declare-fun v__5 () Int)
(declare-fun w__6 () Int)
(declare-fun v__6 () Int)
(declare-fun b__1 () Int)
(declare-fun b__0 () Int)
(declare-fun start () (Array Int Int))
(assert
 (= v__0 w__0))
(assert
 (= v__1 w__1))
(assert
 (= v__2 w__2))
(assert
 (= v__3 w__3))
(assert
 (= v__4 w__4))
(assert
 (= v__5 w__5))
(assert
 (= v__6 w__6))
(assert
 (and (distinct b__0 b__1) true))
(assert
 (>= w__0 0))
(assert
 (>= v__0 0))
(assert
 (<= w__0 7))
(assert
 (<= v__0 7))
(assert
 (>= w__1 0))
(assert
 (>= v__1 0))
(assert
 (<= w__1 7))
(assert
 (<= v__1 7))
(assert
 (>= w__2 0))
(assert
 (>= v__2 0))
(assert
 (<= w__2 7))
(assert
 (<= v__2 7))
(assert
 (>= w__3 0))
(assert
 (>= v__3 0))
(assert
 (<= w__3 7))
(assert
 (<= v__3 7))
(assert
 (>= w__4 0))
(assert
 (>= v__4 0))
(assert
 (<= w__4 7))
(assert
 (<= v__4 7))
(assert
 (>= w__5 0))
(assert
 (>= v__5 0))
(assert
 (<= w__5 7))
(assert
 (<= v__5 7))
(assert
 (>= w__6 0))
(assert
 (>= v__6 0))
(assert
 (<= w__6 7))
(assert
 (<= v__6 7))
(assert
 (let ((?x705 (* b__0 1)))
 (let ((?x379 (+ v__6 ?x705)))
 (let ((?x397 (* b__0 7)))
 (let ((?x343 (+ v__5 ?x397)))
 (let ((?x693 (* b__0 6)))
 (let ((?x694 (+ v__4 ?x693)))
 (let ((?x722 (* b__0 5)))
 (let ((?x723 (+ v__3 ?x722)))
 (let ((?x408 (* b__0 4)))
 (let ((?x220 (+ v__2 ?x408)))
 (let ((?x691 (* b__0 3)))
 (let ((?x697 (+ v__1 ?x691)))
 (let ((?x728 (* b__0 2)))
 (let ((?x729 (+ v__0 ?x728)))
 (let ((?x823 (store start ?x729 (+ (select start ?x729) 1))))
 (let ((?x702 (store ?x823 ?x697 (+ (select ?x823 ?x697) 1))))
 (let ((?x282 (store ?x702 ?x220 (+ (select ?x702 ?x220) 1))))
 (let ((?x44 (store ?x282 ?x723 (+ (select ?x282 ?x723) 1))))
 (let ((?x480 (store ?x44 ?x694 (+ (select ?x44 ?x694) 1))))
 (let ((?x822 (store ?x480 ?x343 (+ (select ?x480 ?x343) 1))))
 (let ((?x428 (store ?x822 ?x379 (+ (select ?x822 ?x379) 1))))
 (let ((?x346 (+ w__6 ?x397)))
 (let ((?x481 (+ w__5 ?x693)))
 (let ((?x430 (+ w__4 ?x722)))
 (let ((?x433 (+ w__3 ?x408)))
 (let ((?x703 (+ w__2 ?x691)))
 (let ((?x372 (+ w__1 ?x728)))
 (let ((?x726 (+ w__0 ?x705)))
 (let ((?x727 (store start ?x726 (+ (select start ?x726) 1))))
 (let ((?x47 (store ?x727 ?x372 (+ (select ?x727 ?x372) 1))))
 (let ((?x280 (store ?x47 ?x703 (+ (select ?x47 ?x703) 1))))
 (let ((?x826 (store ?x280 ?x433 (+ (select ?x280 ?x433) 1))))
 (let ((?x692 (store ?x826 ?x430 (+ (select ?x826 ?x430) 1))))
 (let ((?x396 (store ?x692 ?x481 (+ (select ?x692 ?x481) 1))))
 (let ((?x594 (store ?x396 ?x346 (+ (select ?x396 ?x346) 1))))
 (= ?x594 ?x428)))))))))))))))))))))))))))))))))))))
(assert
 (let ((?x607 (* b__1 1)))
 (let ((?x48 (+ v__6 ?x607)))
 (let ((?x442 (* b__1 7)))
 (let ((?x476 (+ v__5 ?x442)))
 (let ((?x322 (* b__1 6)))
 (let ((?x141 (+ v__4 ?x322)))
 (let ((?x31 (* b__1 5)))
 (let ((?x250 (+ v__3 ?x31)))
 (let ((?x543 (* b__1 4)))
 (let ((?x544 (+ v__2 ?x543)))
 (let ((?x82 (* b__1 3)))
 (let ((?x96 (+ v__1 ?x82)))
 (let ((?x562 (* b__1 2)))
 (let ((?x28 (+ v__0 ?x562)))
 (let ((?x129 (store start ?x28 (+ (select start ?x28) 1))))
 (let ((?x303 (store ?x129 ?x96 (+ (select ?x129 ?x96) 1))))
 (let ((?x329 (store ?x303 ?x544 (+ (select ?x303 ?x544) 1))))
 (let ((?x136 (store ?x329 ?x250 (+ (select ?x329 ?x250) 1))))
 (let ((?x75 (store ?x136 ?x141 (+ (select ?x136 ?x141) 1))))
 (let ((?x297 (store ?x75 ?x476 (+ (select ?x75 ?x476) 1))))
 (let ((?x537 (store ?x297 ?x48 (+ (select ?x297 ?x48) 1))))
 (let ((?x291 (+ w__6 ?x442)))
 (let ((?x68 (+ w__5 ?x322)))
 (let ((?x366 (+ w__4 ?x31)))
 (let ((?x66 (+ w__3 ?x543)))
 (let ((?x268 (+ w__2 ?x82)))
 (let ((?x78 (+ w__1 ?x562)))
 (let ((?x608 (+ w__0 ?x607)))
 (let ((?x561 (store start ?x608 (+ (select start ?x608) 1))))
 (let ((?x288 (store ?x561 ?x78 (+ (select ?x561 ?x78) 1))))
 (let ((?x542 (store ?x288 ?x268 (+ (select ?x288 ?x268) 1))))
 (let ((?x269 (store ?x542 ?x66 (+ (select ?x542 ?x66) 1))))
 (let ((?x377 (store ?x269 ?x366 (+ (select ?x269 ?x366) 1))))
 (let ((?x443 (store ?x377 ?x68 (+ (select ?x377 ?x68) 1))))
 (let ((?x378 (store ?x443 ?x291 (+ (select ?x443 ?x291) 1))))
 (= ?x378 ?x537)))))))))))))))))))))))))))))))))))))
(assert
 (let (($x109 (and (= w__1 v__0) (= w__2 v__1) (= w__3 v__2) (= w__4 v__3) (= w__5 v__4) (= w__6 v__5) (= w__0 v__6))))
 (not $x109)))
(check-sat)
(exit)
