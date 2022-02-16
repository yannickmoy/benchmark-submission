(set-info :smt-lib-version 2.6)
(set-logic AUFBVDTNIRA)
(set-info :source |
Generated by: Yannick Moy
Generated on: 2022-02-14
Generator: GNATprove
Application: GNAT light runtime library
Target solver: Alt-Ergo, CVC4, Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unsat)

;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
  (((Tuple0))))

(declare-sort us_private 0)

;; private__bool_eq
(declare-fun private__bool_eq (us_private
  us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
  (((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))

(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
  (((int__refqtmk (int__content Int)))))

(declare-datatypes ((bool__ref 0))
  (((bool__refqtmk (bool__content Bool)))))

(declare-datatypes ((us_fixed__ref 0))
  (((us_fixed__refqtmk (us_fixed__content Int)))))

(declare-datatypes ((real__ref 0))
  (((real__refqtmk (real__content Real)))))

(declare-datatypes ((us_private__ref 0))
  (((us_private__refqtmk (us_private__content us_private)))))

;; int__ref___projection
(define-fun int__ref___projection ((a int__ref)) Int
  (int__content a))

;; __fixed__ref___projection
(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int
  (us_fixed__content a))

;; bool__ref___projection
(define-fun bool__ref___projection ((a bool__ref)) Bool
  (bool__content a))

;; real__ref___projection
(define-fun real__ref___projection ((a real__ref)) Real
  (real__content a))

;; __private__ref___projection
(define-fun us_private__ref___projection ((a us_private__ref)) us_private
  (us_private__content a))

;; power
(declare-fun power (Int
  Int) Int)

;; Power_0
(assert (forall ((x Int)) (= (power x 0) 1)))

;; Power_s
(assert
  (forall ((x Int) (n Int))
    (=> (<= 0 n) (= (power x (+ n 1)) (* x (power x n))))))

;; Power_s_alt
(assert
  (forall ((x Int) (n Int))
    (=> (< 0 n) (= (power x n) (* x (power x (- n 1)))))))

;; Power_1
(assert (forall ((x Int)) (= (power x 1) x)))

;; Power_sum
(assert
  (forall ((x Int) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power x (+ n m)) (* (power x n) (power x m)))))))

;; Power_mult
(assert
  (forall ((x Int) (n Int) (m Int))
    (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_comm1
(assert
  (forall ((x Int) (y Int))
    (=>
      (= (* x y) (* y x))
      (forall ((n Int))
        (=> (<= 0 n) (= (* (power x n) y) (* y (power x n))))))))

;; Power_comm2
(assert
  (forall ((x Int) (y Int))
    (=>
      (= (* x y) (* y x))
      (forall ((n Int))
        (=> (<= 0 n) (= (power (* x y) n) (* (power x n) (power y n))))))))

;; Power_non_neg
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (<= 0 y)) (<= 0 (power x y)))))

;; Power_pos
(assert
  (forall ((x Int) (y Int)) (=> (and (< 0 x) (<= 0 y)) (< 0 (power x y)))))

;; Power_monotonic
(assert
  (forall ((x Int) (n Int) (m Int))
    (=> (and (< 0 x) (and (<= 0 n) (<= n m))) (<= (power x n) (power x m)))))

;; abs
(define-fun abs1 ((x Int)) Int
  (ite (<= 0 x) x (- x)))

;; Abs_le
(assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
(assert (forall ((x Int)) (<= 0 (abs1 x))))

;; div
(declare-fun div1 (Int
  Int) Int)

;; mod
(declare-fun mod1 (Int
  Int) Int)

;; Div_mod
(assert
  (forall ((x Int) (y Int))
    (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
(assert
  (forall ((x Int) (y Int))
    (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
(assert
  (forall ((x Int) (y Int))
    (=>
      (not (= y 0))
      (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
(assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
(assert
  (forall ((x Int) (y Int))
    (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
(assert
  (forall ((x Int) (y Int))
    (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
(assert
  (forall ((x Int) (y Int))
    (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
(assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
(assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=>
         (and (< 0 x) (and (<= 0 y) (<= 0 z)))
         (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                                  (+ (* x y) z)
                                                                  x)) )))

;; Mod_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=>
         (and (< 0 x) (and (<= 0 y) (<= 0 z)))
         (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1
                                                            (+ (* x y) z)
                                                            x)) )))

;; Div_unique
(assert
  (forall ((x Int) (y Int) (q Int))
    (=>
      (< 0 y)
      (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
(assert
  (forall ((x Int) (y Int))
    (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
(assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
(assert
  (forall ((x Int) (y Int))
    (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
(assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
(assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
(assert
  (forall ((y Int))
    (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
(assert
  (forall ((x Int) (y Int) (z Int))
    (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

;; mod
(define-fun mod2 ((x Int) (y Int)) Int
  (ite (or (and (< 0 x) (< 0 y)) (and (< x 0) (< y 0)))
    (mod1 x y)
    (ite (= (mod1 x y) 0) 0 (+ (mod1 x y) y))))

(declare-sort integer 0)

;; integer'int
(declare-fun integerqtint (integer) Int)

;; integer'axiom
(assert
  (forall ((i integer))
    (and
      (<= (- 2147483648) (integerqtint i))
      (<= (integerqtint i) 2147483647))))

;; in_range
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

;; user_eq
(declare-fun user_eq (integer
  integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
  (((integer__refqtmk (integer__content integer)))))

;; integer__ref_integer__content__projection
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer
  (integer__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool) (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool) (temp___do_typ_inv_17 Bool)) Bool
  (=>
    (or (= temp___is_init_14 true) (<= (- 2147483648) 2147483647))
    (in_range temp___expr_18)))

(declare-sort natural 0)

;; natural'int
(declare-fun naturalqtint (natural) Int)

;; natural'axiom
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; in_range
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq1 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

;; user_eq
(declare-fun user_eq1 (natural
  natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
  (((natural__refqtmk (natural__content natural)))))

;; natural__ref_natural__content__projection
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural
  (natural__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool) (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool) (temp___do_typ_inv_45 Bool)) Bool
  (=>
    (or (= temp___is_init_42 true) (<= 0 2147483647))
    (in_range1 temp___expr_46)))

;; bool_eq
(declare-fun bool_eq2 (Int
  Int) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
(assert (<= 0 value__size))

;; object__size_axiom
(assert (<= 0 object__size))

;; alignment_axiom
(assert (<= 0 alignment))

;; user_eq
(declare-fun user_eq2 (Int
  Int) Bool)

(declare-const dummy2 Int)

(declare-datatypes ((big_integer__ref 0))
  (((big_integer__refqtmk (big_integer__content Int)))))

;; big_integer__ref_big_integer__content__projection
(define-fun big_integer__ref_big_integer__content__projection ((a big_integer__ref)) Int
  (big_integer__content a))

(declare-datatypes ((valid_big_integer__ref 0))
  (((valid_big_integer__refqtmk (valid_big_integer__content Int)))))

;; valid_big_integer__ref_valid_big_integer__content__projection
(define-fun valid_big_integer__ref_valid_big_integer__content__projection 
  ((a valid_big_integer__ref)) Int
  (valid_big_integer__content a))

;; big
(declare-fun big (Int) Int)

;; big__function_guard
(declare-fun big__function_guard (Int
  Int) Bool)

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg Int))
    (! (=> (dynamic_invariant arg true true true true) (= (big arg) arg)) :pattern (
    (big
      arg)) )))

;; in_int_range
(declare-fun in_int_range (Int) Bool)

;; in_int_range__function_guard
(declare-fun in_int_range__function_guard (Bool
  Int) Bool)

;; in_range
(declare-fun in_range2 (Int
  Int
  Int) Bool)

;; in_range__function_guard
(declare-fun in_range__function_guard (Bool
  Int
  Int
  Int) Bool)

;; in_int_range__post_axiom
(assert true)

;; in_int_range__def_axiom
(assert
  (forall ((arg Int))
    (! (=
         (= (in_int_range arg) true)
         (= (in_range2 arg (big (- 2147483648)) (big 2147483647)) true)) :pattern (
    (in_int_range
      arg)) )))

(declare-const left Int)

(declare-const right Int)

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_184 Int) (temp___is_init_180 Bool) (temp___skip_constant_181 Bool) (temp___do_toplevel_182 Bool) (temp___do_typ_inv_183 Bool)) Bool
  true)

;; in_range__post_axiom
(assert true)

;; in_range__def_axiom
(assert
  (forall ((arg Int))
    (forall ((low Int) (high Int))
      (! (=
           (= (in_range2 arg low high) true)
           (and (<= low arg) (<= arg high))) :pattern ((in_range2
                                                         arg
                                                         low
                                                         high)) ))))

(declare-const rest Int)

;; Assume
(assert (dynamic_invariant left true false true true))

;; Assume
(assert (dynamic_invariant1 right true false true true))

;; Assume
(assert (= (in_int_range (power (big left) right)) true))

(declare-const result__ Int)

;; H
(assert (= result__ 1))

;; Assume
(assert (dynamic_invariant result__ true false true true))

(declare-const factor Int)

;; H
(assert (= factor left))

;; Assume
(assert (dynamic_invariant factor true false true true))

(declare-const exp1 Int)

;; H
(assert (= exp1 right))

;; Assume
(assert (dynamic_invariant1 exp1 true false true true))

;; Assume
(assert true)

;; Assume
(assert true)

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused () Bool
  (ite (= right 0) true false))

(declare-const spark__branch Bool)

;; H
(assert (= spark__branch (ite (= right 0) true false)))

;; H
(assert (not (= spark__branch true)))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused1 () Bool
  (ite (= left 0) true false))

(declare-const spark__branch1 Bool)

;; H
(assert (= spark__branch1 (ite (= left 0) true false)))

;; H
(assert (not (= spark__branch1 true)))

(declare-const result__1 Int)

(declare-const factor1 Int)

(declare-const exp2 Int)

(declare-const rest1 Int)

;; LoopInvariant
(assert (< 0 exp2))

;; LoopInvariant
(assert (not (= factor1 0)))

;; LoopInvariant
(assert
  (= (* (big result__1) (power (big factor1) exp2)) (power (big left) right)))

;; Assume
(assert
  (and
    (and
      (dynamic_invariant result__1 true true true true)
      (dynamic_invariant factor1 true true true true))
    (dynamic_invariant1 exp2 true true true true)))

(declare-const result__2 Int)

(declare-const spark__branch2 Bool)

;; H
(assert (= spark__branch2 (ite (= (mod1 exp2 2) 0) false true)))

;; H
(assert
  (ite (= spark__branch2 true)
    (let ((o (* result__1 factor1))) (and (in_range o) (= result__2 o)))
    (= result__2 result__1)))

(declare-const exp3 Int)

;; H
(assert (= exp3 (div1 exp2 2)))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused2 () Bool
  (ite (= exp3 0) true false))

;; H
(assert (not (= exp3 0)))

;; H
(assert true)

;; H
(assert (= (big factor1) factor1))

;; Assert
(assert true)

;; Ensures
(assert (in_range (* factor1 factor1)))

(declare-const factor2 Int)

;; H
(assert (= factor2 (* factor1 factor1)))

;; H
(assert (< exp3 exp2))

;; LoopInvariant
(assert (< 0 exp3))

;; Goal def'vc
;; File "s-exponn.ads", line 66, characters 0-0
(assert
  (not (not (= factor2 0))))

(check-sat)
(exit)
