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

;; min
(define-fun min ((x Int) (y Int)) Int
  (ite (<= x y) x y))

;; max
(define-fun max ((x Int) (y Int)) Int
  (ite (<= x y) y x))

;; Min_r
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
(assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
(assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
(assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
(assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
(assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

;; bool_eq
(define-fun bool_eq ((x Bool) (y Bool)) Bool
  (ite (= x y) true false))

;; to_int
(define-fun to_int1 ((b Bool)) Int
  (ite (= b true) 1 0))

;; of_int
(define-fun of_int ((i Int)) Bool
  (ite (= i 0) false true))

;; in_range
(define-fun in_range ((x Int)) Bool
  (or (= x 0) (= x 1)))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

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
(declare-fun user_eq (integer
  integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
  (((integer__refqtmk (integer__content integer)))))

;; integer__ref_integer__content__projection
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer
  (integer__content a))

(declare-sort long_long_integer 0)

;; long_long_integer'int
(declare-fun long_long_integerqtint (long_long_integer) Int)

;; long_long_integer'axiom
(assert
  (forall ((i long_long_integer))
    (and
      (<= (- 9223372036854775808) (long_long_integerqtint i))
      (<= (long_long_integerqtint i) 9223372036854775807))))

;; in_range
(define-fun in_range2 ((x Int)) Bool
  (and (<= (- 9223372036854775808) x) (<= x 9223372036854775807)))

;; bool_eq
(define-fun bool_eq2 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

;; user_eq
(declare-fun user_eq1 (long_long_integer
  long_long_integer) Bool)

(declare-const dummy1 long_long_integer)

(declare-datatypes ((long_long_integer__ref 0))
  (((long_long_integer__refqtmk
    (long_long_integer__content long_long_integer)))))

;; long_long_integer__ref_long_long_integer__content__projection
(define-fun long_long_integer__ref_long_long_integer__content__projection 
  ((a long_long_integer__ref)) long_long_integer
  (long_long_integer__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_32 Int) (temp___is_init_28 Bool) (temp___skip_constant_29 Bool) (temp___do_toplevel_30 Bool) (temp___do_typ_inv_31 Bool)) Bool
  (=>
    (or
      (= temp___is_init_28 true)
      (<= (- 9223372036854775808) 9223372036854775807))
    (in_range2 temp___expr_32)))

(declare-sort natural 0)

;; natural'int
(declare-fun naturalqtint (natural) Int)

;; natural'axiom
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; in_range
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq3 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

;; user_eq
(declare-fun user_eq2 (natural
  natural) Bool)

(declare-const dummy2 natural)

(declare-datatypes ((natural__ref 0))
  (((natural__refqtmk (natural__content natural)))))

;; natural__ref_natural__content__projection
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural
  (natural__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool) (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool) (temp___do_typ_inv_45 Bool)) Bool
  (=>
    (or (= temp___is_init_42 true) (<= 0 2147483647))
    (in_range3 temp___expr_46)))

(declare-const lo Int)

(declare-const hi Int)

;; bool_eq
(declare-fun bool_eq4 (Int
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
(declare-fun user_eq3 (Int
  Int) Bool)

(declare-const dummy3 Int)

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

;; to_rep
(define-fun to_rep ((x natural)) Int
  (naturalqtint x))

;; of_rep
(declare-fun of_rep (Int) natural)

;; inversion_axiom
(assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
(assert
  (forall ((x natural)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

;; max_log10
(define-fun max_log10 ((us_void_param tuple0)) Int
  (ite (= 64 8)
    2
    (ite (= 64 16)
      4
      (ite (= 64 32) 9 (ite true 19 (ite (= 64 128) 38 (to_rep dummy2)))))))

;; max_log10__function_guard
(declare-fun max_log10__function_guard (Int
  tuple0) Bool)

(declare-datatypes ((big_natural__ref 0))
  (((big_natural__refqtmk (big_natural__content Int)))))

;; big_natural__ref_big_natural__content__projection
(define-fun big_natural__ref_big_natural__content__projection ((a big_natural__ref)) Int
  (big_natural__content a))

(declare-datatypes ((big_positive__ref 0))
  (((big_positive__refqtmk (big_positive__content Int)))))

;; big_positive__ref_big_positive__content__projection
(define-fun big_positive__ref_big_positive__content__projection ((a big_positive__ref)) Int
  (big_positive__content a))

(declare-const max_w Int)

(declare-const big_10 Int)

(declare-const t_init Int)

(declare-const f Int)

(declare-const q Int)

(declare-const r Int)

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool) (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool) (temp___do_typ_inv_17 Bool)) Bool
  (=>
    (or (= temp___is_init_14 true) (<= (- 2147483648) 2147483647))
    (in_range1 temp___expr_18)))

;; dynamic_invariant
(define-fun dynamic_invariant3 ((temp___expr_184 Int) (temp___is_init_180 Bool) (temp___skip_constant_181 Bool) (temp___do_toplevel_182 Bool) (temp___do_typ_inv_183 Bool)) Bool
  true)

;; dynamic_invariant
(define-fun dynamic_invariant4 ((temp___expr_200 Int) (temp___is_init_196 Bool) (temp___skip_constant_197 Bool) (temp___do_toplevel_198 Bool) (temp___do_typ_inv_199 Bool)) Bool
  (=>
    (= temp___do_toplevel_198 true)
    (=> (= temp___is_init_196 true) (< 0 temp___expr_200))))

;; dynamic_invariant
(define-fun dynamic_invariant5 ((temp___expr_192 Int) (temp___is_init_188 Bool) (temp___skip_constant_189 Bool) (temp___do_toplevel_190 Bool) (temp___do_typ_inv_191 Bool)) Bool
  (=>
    (= temp___do_toplevel_190 true)
    (=> (= temp___is_init_188 true) (<= 0 temp___expr_192))))

;; max_w__def_axiom
(assert (= max_w (max_log10 Tuple0)))

;; big_10__def_axiom
(assert (= big_10 10))

;; t_init__def_axiom
(assert
  (= t_init (max
              (abs1 (max lo (- 9223372036854775807)))
              (abs1 (max hi (- 9223372036854775807))))))

;; q__def_axiom
(assert (= q (div1 t_init f)))

;; r__def_axiom
(assert (= r (mod1 t_init f)))

(declare-const w Int)

(declare-const t Int)

;; Assume
(assert (dynamic_invariant lo true false true true))

;; Assume
(assert (dynamic_invariant hi true false true true))

;; Assume
(assert true)

;; Assume
(assert (dynamic_invariant1 w false false true true))

;; Assume
(assert true)

;; Assume
(assert (dynamic_invariant t false false true true))

;; H
(assert (dynamic_invariant1 (max_log10 Tuple0) true false true true))

;; H
(assert
  (= (max_log10 Tuple0) (ite (= 64 8)
                          2
                          (ite (= 64 16)
                            4
                            (ite (= 64 32)
                              9
                              (ite true
                                19
                                (ite (= 64 128) 38 (to_rep dummy2))))))))

;; Assume
(assert (= (max_log10 Tuple0) max_w))

;; Assume
(assert (dynamic_invariant1 max_w true false true true))

;; Assume
(assert (= 10 big_10))

;; Assume
(assert true)

(declare-const pow Int)

;; H
(assert (= pow 1))

;; Assume
(assert true)

;; Ensures
(assert (in_range2 (abs1 (max hi (- 9223372036854775807)))))

;; Ensures
(assert (in_range2 (abs1 (max lo (- 9223372036854775807)))))

;; Assume
(assert
  (= (max
       (abs1 (max lo (- 9223372036854775807)))
       (abs1 (max hi (- 9223372036854775807)))) t_init))

;; Assume
(assert (dynamic_invariant t_init true false true true))

(declare-const spark__branch Bool)

;; H
(assert (= spark__branch (ite (< hi lo) true false)))

;; H
(assert (not (= spark__branch true)))

(declare-const w1 Int)

;; H
(assert (= w1 2))

;; Ensures
(assert (in_range2 (abs1 (max hi (- 9223372036854775807)))))

;; Ensures
(assert (in_range2 (abs1 (max lo (- 9223372036854775807)))))

(declare-const t1 Int)

;; H
(assert
  (= t1 (max
          (abs1 (max lo (- 9223372036854775807)))
          (abs1 (max hi (- 9223372036854775807))))))

;; H
(assert (<= 10 t1))

;; Ensures
(assert true)

;; Assert
(assert (< 0 big_10))

;; Ensures
(assert (in_range3 (- w1 2)))

;; Assert
(assert true)

;; Assert
(assert (< 0 (power big_10 (- w1 2))))

;; Assert
(assert (<= 0 t_init))

;; Ensures
(assert
  (= (div1 (div1 t_init (power big_10 (- w1 2))) big_10) (div1
                                                           t_init
                                                           (* (power
                                                                big_10
                                                                (- w1 2)) 
                                                           big_10))))

(declare-const t2 Int)

;; H
(assert (= t2 (div1 t1 10)))

;; Ensures
(assert (in_range1 (+ w1 1)))

(declare-const w2 Int)

;; H
(assert (= w2 (+ w1 1)))

;; Assert
(assert true)

;; Assert
(assert true)

(declare-const pow1 Int)

;; H
(assert (= pow1 (* pow 10)))

(declare-const w3 Int)

(declare-const t3 Int)

(declare-const pow2 Int)

;; LoopInvariant
(assert (<= 0 t3))

;; LoopInvariant
(assert (and (<= 3 w3) (<= w3 (+ max_w 3))))

;; LoopInvariant
(assert (= pow2 (power big_10 (- w3 2))))

;; LoopInvariant
(assert (= t3 (div1 t_init pow2)))

;; Assume
(assert
  (and
    (dynamic_invariant1 w3 false true true true)
    (dynamic_invariant t3 false true true true)))

;; H
(assert (<= 10 t3))

;; Ensures
(assert true)

;; Assert
(assert (< 0 big_10))

;; Ensures
(assert (in_range3 (- w3 2)))

;; Assert
(assert true)

;; Assert
(assert (< 0 (power big_10 (- w3 2))))

;; Assert
(assert (<= 0 t_init))

;; Ensures
(assert
  (= (div1 (div1 t_init (power big_10 (- w3 2))) big_10) (div1
                                                           t_init
                                                           (* (power
                                                                big_10
                                                                (- w3 2)) 
                                                           big_10))))

(declare-const t4 Int)

;; H
(assert (= t4 (div1 t3 10)))

;; Ensures
(assert (in_range1 (+ w3 1)))

(declare-const w4 Int)

;; H
(assert (= w4 (+ w3 1)))

;; Assert
(assert true)

;; Assert
(assert true)

(declare-const pow3 Int)

;; H
(assert (= pow3 (* pow2 10)))

;; H
(assert (< t4 t3))

;; LoopInvariant
(assert (<= 0 t4))

;; Goal def'vc
;; File "s-widlli.ads", line 51, characters 0-0
(assert
  (not (<= w4 (+ max_w 3))))

(check-sat)
(exit)
