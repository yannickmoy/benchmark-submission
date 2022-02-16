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
(declare-fun nth ((_ BitVec 32)
  Int) Bool)

;; lsr
(declare-fun lsr ((_ BitVec 32)
  Int) (_ BitVec 32))

;; asr
(declare-fun asr ((_ BitVec 32)
  Int) (_ BitVec 32))

;; lsl
(declare-fun lsl ((_ BitVec 32)
  Int) (_ BitVec 32))

;; rotate_right
(declare-fun rotate_right1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; rotate_left
(declare-fun rotate_left1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; pow2
(declare-fun pow2 (Int) Int)

(declare-const two_power_size_minus_one Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one (pow2 (- 32 1))))

;; to_int
(define-fun to_int1 ((x (_ BitVec 32))) Int
  (ite (bvsge x (_ bv0 32)) (bv2nat x) (- (- 4294967296 (bv2nat x)))))

;; uint_in_range
(define-fun uint_in_range ((i Int)) Bool
  (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvlshr x n) (lsr x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvashr x n) (asr x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvshl x n) (lsl x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
(assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
    (rotate_left1
      v
      (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
(assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
    (rotate_right1
      v
      (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv ((_ BitVec 32)
  (_ BitVec 32)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
    (=
      (= (nth_bv x i) true)
      (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
    (= (nth x (bv2nat i)) (nth_bv x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 32)) (i Int))
    (=>
      (and (<= 0 i) (< i 4294967296))
      (= (nth_bv x ((_ int2bv 32) i)) (nth x i)))))

;; eq_sub_bv
(declare-fun eq_sub_bv ((_ BitVec 32)
  (_ BitVec 32)
  (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
(assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32)) (n (_ BitVec 32)))
    (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
      (= (eq_sub_bv a b i n) (= (bvand b mask) (bvand a mask))))))

;; eq_sub
(define-fun eq_sub ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int) (n Int)) Bool
  (forall ((j Int))
    (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

;; eq_sub_equiv
(assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32)) (n (_ BitVec 32)))
    (= (eq_sub a b (bv2nat i) (bv2nat n)) (eq_sub_bv a b i n))))

(declare-datatypes ((t__ref 0))
  (((t__refqtmk (t__content (_ BitVec 32))))))

;; bool_eq
(define-fun bool_eq ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (= x y) true false))

;; bool_ne
(define-fun bool_ne ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (not (= x y)) true false))

;; bool_lt
(define-fun bool_lt ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvult x y) true false))

;; bool_le
(define-fun bool_le ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvule x y) true false))

;; bool_gt
(define-fun bool_gt ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvugt x y) true false))

;; bool_ge
(define-fun bool_ge ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvuge x y) true false))

;; power
(declare-fun power ((_ BitVec 32)
  Int) (_ BitVec 32))

;; Power_0
(assert (forall ((x (_ BitVec 32))) (= (power x 0) #x00000001)))

;; Power_1
(assert (forall ((x (_ BitVec 32))) (= (power x 1) x)))

;; Power_s
(assert
  (forall ((x (_ BitVec 32)) (n Int))
    (=> (<= 0 n) (= (power x (+ n 1)) (bvmul x (power x n))))))

;; Power_s_alt
(assert
  (forall ((x (_ BitVec 32)) (n Int))
    (=> (< 0 n) (= (power x n) (bvmul x (power x (- n 1)))))))

;; Power_sum
(assert
  (forall ((x (_ BitVec 32)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power x (+ n m)) (bvmul (power x n) (power x m)))))))

;; Power_mult
(assert
  (forall ((x (_ BitVec 32)) (n Int) (m Int))
    (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_mult2
(assert
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)) (n Int))
    (=> (<= 0 n) (= (power (bvmul x y) n) (bvmul (power x n) (power y n))))))

;; bv_min
(define-fun bv_min ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
  (ite (bvule x y) x y))

;; bv_max
(define-fun bv_max ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
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
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)))
    (= (bv2nat (bv_min x y)) (min (bv2nat x) (bv2nat y)))))

;; bv_max_to_uint
(assert
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)))
    (= (bv2nat (bv_max x y)) (max (bv2nat x) (bv2nat y)))))

;; uc_of_int
(define-fun uc_of_int ((x Int)) (_ BitVec 32)
  (ite (<= 0 x) ((_ int2bv 32) x) (bvneg ((_ int2bv 32) (- x)))))

;; uc_to_int
(define-fun uc_to_int ((x (_ BitVec 32))) Int
  (ite (= (bool_lt x ((_ int2bv 32) two_power_size_minus_one)) true)
    (bv2nat x)
    (- (bv2nat (bvneg x)))))

;; bool_eq
(declare-fun bool_eq1 (Int
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
(declare-fun user_eq (Int
  Int) Bool)

(declare-const dummy Int)

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

(declare-sort int32 0)

;; int32'int
(declare-fun int32qtint (int32) Int)

;; int32'axiom
(assert
  (forall ((i int32))
    (and (<= (- 2147483648) (int32qtint i)) (<= (int32qtint i) 2147483647))))

;; in_range
(define-fun in_range ((x Int)) Bool
  (and (<= (- 2147483648) x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq2 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

;; user_eq
(declare-fun user_eq1 (int32
  int32) Bool)

(declare-const dummy1 int32)

(declare-datatypes ((int32__ref 0))
  (((int32__refqtmk (int32__content int32)))))

;; int32__ref_int32__content__projection
(define-fun int32__ref_int32__content__projection ((a int32__ref)) int32
  (int32__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_201 Int) (temp___is_init_197 Bool) (temp___skip_constant_198 Bool) (temp___do_toplevel_199 Bool) (temp___do_typ_inv_200 Bool)) Bool
  (=>
    (or (= temp___is_init_197 true) (<= (- 2147483648) 2147483647))
    (in_range temp___expr_201)))

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg Int))
    (! (=> (dynamic_invariant arg true true true true) (= (big arg) arg)) :pattern (
    (big
      arg)) )))

;; in_int32_range
(declare-fun in_int32_range (Int) Bool)

;; in_int32_range__function_guard
(declare-fun in_int32_range__function_guard (Bool
  Int) Bool)

;; in_range
(declare-fun in_range1 (Int
  Int
  Int) Bool)

;; in_range__function_guard
(declare-fun in_range__function_guard (Bool
  Int
  Int
  Int) Bool)

;; in_int32_range__post_axiom
(assert true)

;; in_int32_range__def_axiom
(assert
  (forall ((arg Int))
    (! (=
         (= (in_int32_range arg) true)
         (= (in_range1 arg (big (- 2147483648)) (big 2147483647)) true)) :pattern (
    (in_int32_range
      arg)) )))

;; round_quotient
(declare-fun round_quotient (Int
  Int
  Int
  Int) Int)

;; round_quotient__function_guard
(declare-fun round_quotient__function_guard (Int
  Int
  Int
  Int
  Int) Bool)

;; same_sign
(declare-fun same_sign (Int
  Int) Bool)

;; same_sign__function_guard
(declare-fun same_sign__function_guard (Bool
  Int
  Int) Bool)

;; round_quotient__post_axiom
(assert true)

;; round_quotient__def_axiom
(assert
  (forall ((x Int) (y Int) (q Int) (r Int))
    (! (= (round_quotient x y q r) (ite (< (div1
                                             (- (abs1 y) (big 1))
                                             (big 2)) (abs1 r))
                                     (ite (= (same_sign x y) true)
                                       (+ q (big 1))
                                       (- q (big 1)))
                                     q)) :pattern ((round_quotient x y q r)) )))

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

;; big
(declare-fun big1 ((_ BitVec 32)) Int)

;; big__function_guard
(declare-fun big__function_guard1 (Int
  (_ BitVec 32)) Bool)

(declare-sort uns32 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

;; bool_eq
(define-fun bool_eq3 ((x1 (_ BitVec 32)) (y1 (_ BitVec 32))) Bool
  (ite (= x1 y1) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 32)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 32))

;; user_eq
(declare-fun user_eq2 (uns32
  uns32) Bool)

(declare-const dummy2 uns32)

(declare-datatypes ((uns32__ref 0))
  (((uns32__refqtmk (uns32__content uns32)))))

;; uns32__ref_uns32__content__projection
(define-fun uns32__ref_uns32__content__projection ((a uns32__ref)) uns32
  (uns32__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_242 (_ BitVec 32)) (temp___is_init_238 Bool) (temp___skip_constant_239 Bool) (temp___do_toplevel_240 Bool) (temp___do_typ_inv_241 Bool)) Bool
  true)

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg (_ BitVec 32)))
    (! (=>
         (dynamic_invariant1 arg true true true true)
         (= (big1 arg) (bv2nat arg))) :pattern ((big1 arg)) )))

(declare-const big_2xx32 Int)

;; oabs
(define-fun oabs ((x1 Int)) (_ BitVec 32)
  (ite (= x1 (- 2147483648)) #x80000000 ((_ int2bv 32) (abs1 x1))))

;; oabs__function_guard
(declare-fun oabs__function_guard ((_ BitVec 32)
  Int) Bool)

(declare-const mult Int)

;; big_2xx32__def_axiom
(assert (= big_2xx32 (+ (big1 #xFFFFFFFF) 1)))

;; mult__def_axiom
(assert (= mult (abs1 (* (big x) (big y)))))

;; same_sign__post_axiom
(assert true)

;; same_sign__def_axiom
(assert
  (forall ((x1 Int) (y1 Int))
    (! (=
         (= (same_sign x1 y1) true)
         (or
           (or (= x1 (big 0)) (= y1 (big 0)))
           (= (< x1 (big 0)) (< y1 (big 0))))) :pattern ((same_sign x1 y1)) )))

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_222 Int) (temp___is_init_218 Bool) (temp___skip_constant_219 Bool) (temp___do_toplevel_220 Bool) (temp___do_typ_inv_221 Bool)) Bool
  true)

;; in_range__post_axiom
(assert true)

;; in_range__def_axiom
(assert
  (forall ((arg Int))
    (forall ((low Int) (high Int))
      (! (=
           (= (in_range1 arg low high) true)
           (and (<= low arg) (<= arg high))) :pattern ((in_range1
                                                         arg
                                                         low
                                                         high)) ))))

;; Assume
(assert true)

;; Assume
(assert (= (+ (big1 #xFFFFFFFF) 1) big_2xx32))

;; Assume
(assert (dynamic_invariant x true false true true))

;; Assume
(assert (dynamic_invariant y true false true true))

;; Assume
(assert (dynamic_invariant z true false true true))

;; Assume
(assert true)

;; Assume
(assert (= (abs1 (* (big x) (big y))) mult))

;; Assume
(assert (dynamic_invariant x true false true true))

;; Assume
(assert (dynamic_invariant y true false true true))

;; Assume
(assert (dynamic_invariant z true false true true))

;; Assume
(assert (and (not (= z 0)) (<= (* big_2xx32 (big1 (oabs z))) mult)))

;; H
(assert (dynamic_invariant1 (oabs z) true false true true))

;; H
(assert
  (= (oabs z) (ite (= z (- 2147483648)) #x80000000 ((_ int2bv 32) (abs1 z)))))

;; H
(assert true)

;; H
(assert (= (big1 (oabs z)) (bv2nat (oabs z))))

;; Ensures
(assert (<= big_2xx32 (div1 mult (big1 (oabs z)))))

;; Ensures
(assert (= (abs1 (big z)) (big1 (oabs z))))

;; H
(assert true)

;; H
(assert (= (big z) z))

;; H
(assert true)

;; H
(assert (= (big y) y))

;; Assert
(assert true)

;; H
(assert true)

;; H
(assert (= (big x) x))

;; Assert
(assert true)

;; Ensures
(assert
  (= (abs1 (div1 (* (big x) (big y)) (big z))) (div1
                                                 (abs1 (* (big x) (big y)))
                                                 (abs1 (big z)))))

;; Goal def'vc
;; File "s-arit32.adb", line 345, characters 0-0
(assert
  (not
  (not
    (= (in_int32_range
         (round_quotient
           (* (big x) (big y))
           (big z)
           (div1 (* (big x) (big y)) (big z))
           (mod1 (* (big x) (big y)) (big z)))) true))))

(check-sat)
(exit)
