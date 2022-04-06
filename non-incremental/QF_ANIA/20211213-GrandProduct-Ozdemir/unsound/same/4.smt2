
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
 (and (distinct b__0 b__1) true))
(assert
 (>= w__0 0))
(assert
 (>= v__0 0))
(assert
 (<= w__0 4))
(assert
 (<= v__0 4))
(assert
 (>= w__1 0))
(assert
 (>= v__1 0))
(assert
 (<= w__1 4))
(assert
 (<= v__1 4))
(assert
 (>= w__2 0))
(assert
 (>= v__2 0))
(assert
 (<= w__2 4))
(assert
 (<= v__2 4))
(assert
 (>= w__3 0))
(assert
 (>= v__3 0))
(assert
 (<= w__3 4))
(assert
 (<= v__3 4))
(assert
 (let ((?x62 (* b__0 1)))
 (let ((?x99 (+ v__3 ?x62)))
 (let ((?x254 (* b__0 4)))
 (let ((?x255 (+ v__2 ?x254)))
 (let ((?x210 (* b__0 3)))
 (let ((?x211 (+ v__1 ?x210)))
 (let ((?x248 (* b__0 2)))
 (let ((?x249 (+ v__0 ?x248)))
 (let ((?x209 (store start ?x249 (+ (select start ?x249) 1))))
 (let ((?x71 (store ?x209 ?x211 (+ (select ?x209 ?x211) 1))))
 (let ((?x208 (store ?x71 ?x255 (+ (select ?x71 ?x255) 1))))
 (let ((?x139 (store ?x208 ?x99 (+ (select ?x208 ?x99) 1))))
 (let ((?x101 (+ w__3 ?x254)))
 (let ((?x70 (+ w__2 ?x210)))
 (let ((?x167 (+ w__1 ?x248)))
 (let ((?x61 (+ w__0 ?x62)))
 (let ((?x60 (store start ?x61 (+ (select start ?x61) 1))))
 (let ((?x66 (store ?x60 ?x167 (+ (select ?x60 ?x167) 1))))
 (let ((?x253 (store ?x66 ?x70 (+ (select ?x66 ?x70) 1))))
 (let ((?x91 (store ?x253 ?x101 (+ (select ?x253 ?x101) 1))))
 (= ?x91 ?x139))))))))))))))))))))))
(assert
 (let ((?x241 (* b__1 1)))
 (let ((?x150 (+ v__3 ?x241)))
 (let ((?x104 (* b__1 4)))
 (let ((?x126 (+ v__2 ?x104)))
 (let ((?x274 (* b__1 3)))
 (let ((?x275 (+ v__1 ?x274)))
 (let ((?x181 (* b__1 2)))
 (let ((?x180 (+ v__0 ?x181)))
 (let ((?x172 (store start ?x180 (+ (select start ?x180) 1))))
 (let ((?x95 (store ?x172 ?x275 (+ (select ?x172 ?x275) 1))))
 (let ((?x103 (store ?x95 ?x126 (+ (select ?x95 ?x126) 1))))
 (let ((?x57 (store ?x103 ?x150 (+ (select ?x103 ?x150) 1))))
 (let ((?x120 (+ w__3 ?x104)))
 (let ((?x273 (+ w__2 ?x274)))
 (let ((?x171 (+ w__1 ?x181)))
 (let ((?x189 (+ w__0 ?x241)))
 (let ((?x182 (store start ?x189 (+ (select start ?x189) 1))))
 (let ((?x185 (store ?x182 ?x171 (+ (select ?x182 ?x171) 1))))
 (let ((?x259 (store ?x185 ?x273 (+ (select ?x185 ?x273) 1))))
 (let ((?x149 (store ?x259 ?x120 (+ (select ?x259 ?x120) 1))))
 (= ?x149 ?x57))))))))))))))))))))))
(assert
 (let (($x146 (and (= w__1 v__0) (= w__2 v__1) (= w__3 v__2) (= w__0 v__3))))
 (not $x146)))
(check-sat)
(exit)
