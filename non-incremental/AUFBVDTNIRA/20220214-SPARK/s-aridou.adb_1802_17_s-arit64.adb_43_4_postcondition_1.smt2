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
(declare-fun nth ((_ BitVec 64)
  Int) Bool)

;; lsr
(declare-fun lsr ((_ BitVec 64)
  Int) (_ BitVec 64))

;; asr
(declare-fun asr ((_ BitVec 64)
  Int) (_ BitVec 64))

;; lsl
(declare-fun lsl ((_ BitVec 64)
  Int) (_ BitVec 64))

;; rotate_right
(declare-fun rotate_right1 ((_ BitVec 64)
  Int) (_ BitVec 64))

;; rotate_left
(declare-fun rotate_left1 ((_ BitVec 64)
  Int) (_ BitVec 64))

;; pow2
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one (pow2 (- 64 1))))

;; to_int
(define-fun to_int1 ((x (_ BitVec 64))) Int
  (ite (bvsge x (_ bv0 64))
    (bv2nat x)
    (- (- 18446744073709551616 (bv2nat x)))))

;; uint_in_range
(define-fun uint_in_range ((i Int)) Bool
  (and (<= 0 i) (<= i 18446744073709551615)))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
(assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvor (bvshl v (bvurem n (_ bv64 64))) (bvlshr v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
    (rotate_left1
      v
      (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
(assert
  (forall ((v (_ BitVec 64)) (n (_ BitVec 64)))
    (= (bvor (bvlshr v (bvurem n (_ bv64 64))) (bvshl v (bvsub (_ bv64 64) (bvurem n (_ bv64 64))))) 
    (rotate_right1
      v
      (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv ((_ BitVec 64)
  (_ BitVec 64)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
    (=
      (= (nth_bv x i) true)
      (not (= (bvand (bvlshr x i) #x0000000000000001) #x0000000000000000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 64)) (i (_ BitVec 64)))
    (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 64)) (i Int))
    (=>
      (and (<= 0 i) (< i 18446744073709551616))
      (= (nth_bv x ((_ int2bv 64) i)) (nth x i)))))

;; eq_sub_bv
(declare-fun eq_sub_bv ((_ BitVec 64)
  (_ BitVec 64)
  (_ BitVec 64)
  (_ BitVec 64)) Bool)

;; eq_sub_bv_def
(assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64)) (n (_ BitVec 64)))
    (let ((mask (bvshl (bvsub (bvshl #x0000000000000001 n) #x0000000000000001) i)))
      (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

;; eq_sub
(define-fun eq_sub ((a (_ BitVec 64)) (b (_ BitVec 64)) (i Int) (n Int)) Bool
  (forall ((j Int))
    (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
(assert
  (forall ((a (_ BitVec 64)) (b (_ BitVec 64)) (i (_ BitVec 64)) (n (_ BitVec 64)))
    (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
  (((t__refqtmk (t__content (_ BitVec 64))))))

;; bool_eq
(define-fun bool_eq ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (= x y) true false))

;; bool_ne
(define-fun bool_ne ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (not (= x y)) true false))

;; bool_lt
(define-fun bool_lt ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (bvult x y) true false))

;; bool_le
(define-fun bool_le ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (bvule x y) true false))

;; bool_gt
(define-fun bool_gt ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (bvugt x y) true false))

;; bool_ge
(define-fun bool_ge ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (bvuge x y) true false))

;; power
(declare-fun power ((_ BitVec 64)
  Int) (_ BitVec 64))

;; Power_0
(assert (forall ((x (_ BitVec 64))) (= (power x 0) #x0000000000000001)))

;; Power_1
(assert (forall ((x (_ BitVec 64))) (= (power x 1) x)))

;; Power_s
(assert
  (forall ((x (_ BitVec 64)) (n Int))
    (=> (<= 0 n) (= (power x (+ n 1)) (bvmul x (power x n))))))

;; Power_s_alt
(assert
  (forall ((x (_ BitVec 64)) (n Int))
    (=> (< 0 n) (= (power x n) (bvmul x (power x (- n 1)))))))

;; Power_sum
(assert
  (forall ((x (_ BitVec 64)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power x (+ n m)) (bvmul (power x n) (power x m)))))))

;; Power_mult
(assert
  (forall ((x (_ BitVec 64)) (n Int) (m Int))
    (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_mult2
(assert
  (forall ((x (_ BitVec 64)) (y (_ BitVec 64)) (n Int))
    (=> (<= 0 n) (= (power (bvmul x y) n) (bvmul (power x n) (power y n))))))

;; bv_min
(define-fun bv_min ((x (_ BitVec 64)) (y (_ BitVec 64))) (_ BitVec 64)
  (ite (bvule x y) x y))

;; bv_max
(define-fun bv_max ((x (_ BitVec 64)) (y (_ BitVec 64))) (_ BitVec 64)
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
  (forall ((x (_ BitVec 64)) (y (_ BitVec 64)))
    (= (bv2nat (bv_min x y)) (min (bv2nat x) (bv2nat y)))))

;; bv_max_to_uint
(assert
  (forall ((x (_ BitVec 64)) (y (_ BitVec 64)))
    (= (bv2nat (bv_max x y)) (max (bv2nat x) (bv2nat y)))))

;; uc_of_int
(define-fun uc_of_int ((x Int)) (_ BitVec 64)
  (ite (<= 0 x) ((_ int2bv 64) x) (bvneg ((_ int2bv 64) (- x)))))

;; uc_to_int
(define-fun uc_to_int ((x (_ BitVec 64))) Int
  (ite (= (bool_lt x ((_ int2bv 64) two_power_size_minus_one)) true)
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
(declare-fun user_eq1 (Int
  Int) Bool)

(declare-const dummy1 Int)

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

(declare-sort int64 0)

;; int64'int
(declare-fun int64qtint (int64) Int)

;; int64'axiom
(assert
  (forall ((i int64))
    (and
      (<= (- 9223372036854775808) (int64qtint i))
      (<= (int64qtint i) 9223372036854775807))))

;; in_range
(define-fun in_range1 ((x Int)) Bool
  (and (<= (- 9223372036854775808) x) (<= x 9223372036854775807)))

;; bool_eq
(define-fun bool_eq3 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

;; user_eq
(declare-fun user_eq2 (int64
  int64) Bool)

(declare-const dummy2 int64)

(declare-datatypes ((int64__ref 0))
  (((int64__refqtmk (int64__content int64)))))

;; int64__ref_int64__content__projection
(define-fun int64__ref_int64__content__projection ((a int64__ref)) int64
  (int64__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_235 Int) (temp___is_init_231 Bool) (temp___skip_constant_232 Bool) (temp___do_toplevel_233 Bool) (temp___do_typ_inv_234 Bool)) Bool
  (=>
    (or
      (= temp___is_init_231 true)
      (<= (- 9223372036854775808) 9223372036854775807))
    (in_range1 temp___expr_235)))

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg Int))
    (! (=> (dynamic_invariant1 arg true true true true) (= (big arg) arg)) :pattern (
    (big
      arg)) )))

;; big
(declare-fun big1 ((_ BitVec 64)) Int)

;; big__function_guard
(declare-fun big__function_guard1 (Int
  (_ BitVec 64)) Bool)

(declare-sort uns64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; bool_eq
(define-fun bool_eq4 ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE2 ((_ BitVec 64)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) (_ BitVec 64))

;; user_eq
(declare-fun user_eq3 (uns64
  uns64) Bool)

(declare-const dummy3 uns64)

(declare-datatypes ((uns64__ref 0))
  (((uns64__refqtmk (uns64__content uns64)))))

;; uns64__ref_uns64__content__projection
(define-fun uns64__ref_uns64__content__projection ((a uns64__ref)) uns64
  (uns64__content a))

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_282 (_ BitVec 64)) (temp___is_init_278 Bool) (temp___skip_constant_279 Bool) (temp___do_toplevel_280 Bool) (temp___do_typ_inv_281 Bool)) Bool
  true)

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg (_ BitVec 64)))
    (! (=>
         (dynamic_invariant2 arg true true true true)
         (= (big1 arg) (bv2nat arg))) :pattern ((big1 arg)) )))

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

;; oabs
(define-fun oabs ((x1 Int)) (_ BitVec 64)
  (ite (= x1 (- 9223372036854775808))
    #x8000000000000000
    ((_ int2bv 64) (abs1 x1))))

;; oabs__function_guard
(declare-fun oabs__function_guard ((_ BitVec 64)
  Int) Bool)

;; big_2xx
(declare-fun big_2xx (Int) Int)

;; big_2xx__function_guard
(declare-fun big_2xx__function_guard (Int
  Int) Bool)

;; big_2xx__post_axiom
(assert
  (forall ((n Int))
    (! (=>
         (and (dynamic_invariant n true true true true) (< n 64))
         (let ((result (big_2xx n)))
           (=> (big_2xx__function_guard result n) (< 0 result)))) :pattern (
    (big_2xx
      n)) )))

;; big_2xx__def_axiom
(assert
  (forall ((n Int))
    (! (=>
         (dynamic_invariant n true true true true)
         (= (big_2xx n) (big1
                          (ite (< n 18446744073709551616)
                            (bvshl #x0000000000000001 ((_ int2bv 64) n))
                            #x0000000000000000)))) :pattern ((big_2xx n)) )))

(declare-const mult Int)

;; dynamic_invariant
(define-fun dynamic_invariant3 ((temp___expr_256 Int) (temp___is_init_252 Bool) (temp___skip_constant_253 Bool) (temp___do_toplevel_254 Bool) (temp___do_typ_inv_255 Bool)) Bool
  true)

;; mult__def_axiom
(assert (= mult (abs1 (* (big x) (big y)))))

(declare-const zu (_ BitVec 64))

(declare-const qu (_ BitVec 64))

(declare-const ru (_ BitVec 64))

(declare-const scale Int)

(declare-const quot Int)

(declare-const big_r Int)

;; Assume
(assert (dynamic_invariant1 x true false true true))

;; Assume
(assert (dynamic_invariant1 y true false true true))

;; Assume
(assert (dynamic_invariant1 z true false true true))

;; Assume
(assert (dynamic_invariant1 x true false true true))

;; Assume
(assert (dynamic_invariant1 y true false true true))

;; Assume
(assert (dynamic_invariant1 z true false true true))

;; Assume
(assert (dynamic_invariant2 zu true false true true))

;; Assume
(assert (dynamic_invariant2 qu true false true true))

;; Assume
(assert (dynamic_invariant2 ru true false true true))

;; Assume
(assert (dynamic_invariant scale true false true true))

;; Assume
(assert true)

;; Assume
(assert (= (abs1 (* (big x) (big y))) mult))

;; Assume
(assert true)

;; Assume
(assert true)

;; Assume
(assert
  (and
    (and
      (and
        (and
          (and
            (and (<= scale 32) (not (= z 0)))
            (and
              (big_2xx__function_guard (big_2xx scale) scale)
              (= (* mult (big_2xx scale)) (+ (* (big1 zu) (big1 qu)) 
              (big1
                ru)))))
          (< (big1 ru) (big1 zu)))
        (and
          (big_2xx__function_guard (big_2xx scale) scale)
          (= (big1 zu) (* (big1 (oabs z)) (big_2xx scale)))))
      (= quot (div1 (* (big x) (big y)) (big z))))
    (= big_r (mod1 (* (big x) (big y)) (big z)))))

;; Goal def'vc
;; File "s-aridou.adb", line 1792, characters 0-0
(assert
  (not (= (abs1 big_r) (big1 (bvlshr ru ((_ int2bv 64) scale))))))

(check-sat)
(exit)
