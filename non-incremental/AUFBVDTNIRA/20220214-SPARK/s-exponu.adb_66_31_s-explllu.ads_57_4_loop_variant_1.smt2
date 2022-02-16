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

;; nth
(declare-fun nth ((_ BitVec 128)
  Int) Bool)

;; lsr
(declare-fun lsr ((_ BitVec 128)
  Int) (_ BitVec 128))

;; asr
(declare-fun asr ((_ BitVec 128)
  Int) (_ BitVec 128))

;; lsl
(declare-fun lsl ((_ BitVec 128)
  Int) (_ BitVec 128))

;; rotate_right
(declare-fun rotate_right1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; rotate_left
(declare-fun rotate_left1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; pow2
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one (pow2 (- 128 1))))

;; to_int
(define-fun to_int1 ((x (_ BitVec 128))) Int
  (ite (bvsge x (_ bv0 128))
    (bv2nat x)
    (- (- 340282366920938463463374607431768211456 (bv2nat x)))))

;; uint_in_range
(define-fun uint_in_range ((i Int)) Bool
  (and (<= 0 i) (<= i 340282366920938463463374607431768211455)))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
(assert
  (forall ((v (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvor (bvshl v (bvurem n (_ bv128 128))) (bvlshr v (bvsub (_ bv128 128) (bvurem n (_ bv128 128))))) 
    (rotate_left1
      v
      (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
(assert
  (forall ((v (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvor (bvlshr v (bvurem n (_ bv128 128))) (bvshl v (bvsub (_ bv128 128) (bvurem n (_ bv128 128))))) 
    (rotate_right1
      v
      (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv ((_ BitVec 128)
  (_ BitVec 128)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 128)) (i (_ BitVec 128)))
    (=
      (= (nth_bv x i) true)
      (not
        (= (bvand (bvlshr x i) #x00000000000000000000000000000001) #x00000000000000000000000000000000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 128)) (i (_ BitVec 128)))
    (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 128)) (i Int))
    (=>
      (and (<= 0 i) (< i 340282366920938463463374607431768211456))
      (= (nth_bv x ((_ int2bv 128) i)) (nth x i)))))

;; eq_sub_bv
(declare-fun eq_sub_bv ((_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 128)) Bool)

;; eq_sub_bv_def
(assert
  (forall ((a (_ BitVec 128)) (b (_ BitVec 128)) (i (_ BitVec 128)) (n (_ BitVec 128)))
    (let ((mask (bvshl (bvsub (bvshl #x00000000000000000000000000000001 n) #x00000000000000000000000000000001) i)))
      (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

;; eq_sub
(define-fun eq_sub ((a (_ BitVec 128)) (b (_ BitVec 128)) (i Int) (n Int)) Bool
  (forall ((j Int))
    (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
(assert
  (forall ((a (_ BitVec 128)) (b (_ BitVec 128)) (i (_ BitVec 128)) (n (_ BitVec 128)))
    (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
  (((t__refqtmk (t__content (_ BitVec 128))))))

;; bool_eq
(define-fun bool_eq ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (= x y) true false))

;; bool_ne
(define-fun bool_ne ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (not (= x y)) true false))

;; bool_lt
(define-fun bool_lt ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvult x y) true false))

;; bool_le
(define-fun bool_le ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvule x y) true false))

;; bool_gt
(define-fun bool_gt ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvugt x y) true false))

;; bool_ge
(define-fun bool_ge ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvuge x y) true false))

;; power
(declare-fun power ((_ BitVec 128)
  Int) (_ BitVec 128))

;; Power_0
(assert
  (forall ((x (_ BitVec 128)))
    (= (power x 0) #x00000000000000000000000000000001)))

;; Power_1
(assert (forall ((x (_ BitVec 128))) (= (power x 1) x)))

;; Power_s
(assert
  (forall ((x (_ BitVec 128)) (n Int))
    (=> (<= 0 n) (= (power x (+ n 1)) (bvmul x (power x n))))))

;; Power_s_alt
(assert
  (forall ((x (_ BitVec 128)) (n Int))
    (=> (< 0 n) (= (power x n) (bvmul x (power x (- n 1)))))))

;; Power_sum
(assert
  (forall ((x (_ BitVec 128)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power x (+ n m)) (bvmul (power x n) (power x m)))))))

;; Power_mult
(assert
  (forall ((x (_ BitVec 128)) (n Int) (m Int))
    (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_mult2
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)) (n Int))
    (=> (<= 0 n) (= (power (bvmul x y) n) (bvmul (power x n) (power y n))))))

;; bv_min
(define-fun bv_min ((x (_ BitVec 128)) (y (_ BitVec 128))) (_ BitVec 128)
  (ite (bvule x y) x y))

;; bv_max
(define-fun bv_max ((x (_ BitVec 128)) (y (_ BitVec 128))) (_ BitVec 128)
  (ite (bvule x y) y x))

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

;; bv_min_to_uint
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)))
    (= (bv2nat (bv_min x y)) (min (bv2nat x) (bv2nat y)))))

;; bv_max_to_uint
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)))
    (= (bv2nat (bv_max x y)) (max (bv2nat x) (bv2nat y)))))

;; uc_of_int
(define-fun uc_of_int ((x Int)) (_ BitVec 128)
  (ite (<= 0 x) ((_ int2bv 128) x) (bvneg ((_ int2bv 128) (- x)))))

;; uc_to_int
(define-fun uc_to_int ((x (_ BitVec 128))) Int
  (ite (= (bool_lt x ((_ int2bv 128) two_power_size_minus_one)) true)
    (bv2nat x)
    (- (bv2nat (bvneg x)))))

(declare-sort natural 0)

;; natural'int
(declare-fun naturalqtint (natural) Int)

;; natural'axiom
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; in_range
(define-fun in_range ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq1 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

;; user_eq
(declare-fun user_eq (natural
  natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
  (((natural__refqtmk (natural__content natural)))))

;; natural__ref_natural__content__projection
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural
  (natural__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool) (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool) (temp___do_typ_inv_45 Bool)) Bool
  (=>
    (or (= temp___is_init_42 true) (<= 0 2147483647))
    (in_range temp___expr_46)))

(declare-const left (_ BitVec 128))

(declare-const right Int)

(declare-sort long_long_long_unsigned 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 128))

;; bool_eq
(define-fun bool_eq2 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 128)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 128))

;; user_eq
(declare-fun user_eq1 (long_long_long_unsigned
  long_long_long_unsigned) Bool)

(declare-const dummy1 long_long_long_unsigned)

(declare-datatypes ((long_long_long_unsigned__ref 0))
  (((long_long_long_unsigned__refqtmk
    (long_long_long_unsigned__content long_long_long_unsigned)))))

;; long_long_long_unsigned__ref_long_long_long_unsigned__content__2__projection
(define-fun long_long_long_unsigned__ref_long_long_long_unsigned__content__2__projection 
  ((a long_long_long_unsigned__ref)) long_long_long_unsigned
  (long_long_long_unsigned__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_180 (_ BitVec 128)) (temp___is_init_176 Bool) (temp___skip_constant_177 Bool) (temp___do_toplevel_178 Bool) (temp___do_typ_inv_179 Bool)) Bool
  true)

;; Assume
(assert (dynamic_invariant1 left true false true true))

;; Assume
(assert (dynamic_invariant right true false true true))

(declare-const result__ (_ BitVec 128))

;; H
(assert (= result__ #x00000000000000000000000000000001))

;; Assume
(assert (dynamic_invariant1 result__ true false true true))

(declare-const factor (_ BitVec 128))

;; H
(assert (= factor left))

;; Assume
(assert (dynamic_invariant1 factor true false true true))

(declare-const exp1 Int)

;; H
(assert (= exp1 right))

;; Assume
(assert (dynamic_invariant exp1 true false true true))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused () Bool
  (ite (= exp1 0) true false))

(declare-const spark__branch Bool)

;; H
(assert (= spark__branch (ite (= exp1 0) false true)))

;; H
(assert (= spark__branch true))

(declare-const result__1 (_ BitVec 128))

(declare-const factor1 (_ BitVec 128))

(declare-const exp2 Int)

;; LoopInvariant
(assert (< 0 exp2))

;; LoopInvariant
(assert (= (bvmul result__1 (power factor1 exp2)) (power left right)))

;; Assume
(assert
  (and
    (and
      (dynamic_invariant1 result__1 true true true true)
      (dynamic_invariant1 factor1 true true true true))
    (dynamic_invariant exp2 true true true true)))

(declare-const result__2 (_ BitVec 128))

(declare-const spark__branch1 Bool)

;; H
(assert (= spark__branch1 (ite (= (mod1 exp2 2) 0) false true)))

;; H
(assert
  (ite (= spark__branch1 true)
    (and
      (= (bvmul result__1 (bvmul factor1 (power factor1 (- exp2 1)))) 
      (power
        left
        right))
      (and
        (= (bvmul (bvmul result__1 factor1) (power factor1 (- exp2 1))) 
        (power
          left
          right))
        (= result__2 (bvmul result__1 factor1))))
    (= result__2 result__1)))

(declare-const exp3 Int)

;; H
(assert (= exp3 (div1 exp2 2)))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused1 () Bool
  (ite (= exp3 0) true false))

;; H
(assert (not (= exp3 0)))

(declare-const factor2 (_ BitVec 128))

;; H
(assert (= factor2 (bvmul factor1 factor1)))

;; Goal def'vc
;; File "s-explllu.ads", line 57, characters 0-0
(assert
  (not (< exp3 exp2)))

(check-sat)
(exit)
