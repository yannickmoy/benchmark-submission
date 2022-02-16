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

;; abs
(define-fun abs1 ((x Int)) Int
  (ite (<= 0 x) x (- x)))

;; Abs_le
(assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
(assert (forall ((x Int)) (<= 0 (abs1 x))))

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

;; nth
(declare-fun nth1 ((_ BitVec 32)
  Int) Bool)

;; lsr
(declare-fun lsr1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; asr
(declare-fun asr1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; lsl
(declare-fun lsl1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; rotate_right
(declare-fun rotate_right2 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; rotate_left
(declare-fun rotate_left2 ((_ BitVec 32)
  Int) (_ BitVec 32))

(declare-const two_power_size_minus_one1 Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one1 (pow2 (- 32 1))))

;; to_int
(define-fun to_int2 ((x (_ BitVec 32))) Int
  (ite (bvsge x (_ bv0 32)) (bv2nat x) (- (- 4294967296 (bv2nat x)))))

;; uint_in_range
(define-fun uint_in_range1 ((i Int)) Bool
  (and (<= 0 i) (<= i 4294967295)))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
(assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvor (bvshl v (bvurem n (_ bv32 32))) (bvlshr v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
    (rotate_left2
      v
      (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
(assert
  (forall ((v (_ BitVec 32)) (n (_ BitVec 32)))
    (= (bvor (bvlshr v (bvurem n (_ bv32 32))) (bvshl v (bvsub (_ bv32 32) (bvurem n (_ bv32 32))))) 
    (rotate_right2
      v
      (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv1 ((_ BitVec 32)
  (_ BitVec 32)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
    (=
      (= (nth_bv1 x i) true)
      (not (= (bvand (bvlshr x i) #x00000001) #x00000000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 32)) (i (_ BitVec 32)))
    (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 32)) (i Int))
    (=>
      (and (<= 0 i) (< i 4294967296))
      (= (nth_bv1 x ((_ int2bv 32) i)) (nth1 x i)))))

;; eq_sub_bv
(declare-fun eq_sub_bv1 ((_ BitVec 32)
  (_ BitVec 32)
  (_ BitVec 32)
  (_ BitVec 32)) Bool)

;; eq_sub_bv_def
(assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32)) (n (_ BitVec 32)))
    (let ((mask (bvshl (bvsub (bvshl #x00000001 n) #x00000001) i)))
      (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

;; eq_sub
(define-fun eq_sub1 ((a (_ BitVec 32)) (b (_ BitVec 32)) (i Int) (n Int)) Bool
  (forall ((j Int))
    (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
(assert
  (forall ((a (_ BitVec 32)) (b (_ BitVec 32)) (i (_ BitVec 32)) (n (_ BitVec 32)))
    (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

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
(declare-fun big ((_ BitVec 64)) Int)

;; big__function_guard
(declare-fun big__function_guard (Int
  (_ BitVec 64)) Bool)

(declare-sort uns64 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; bool_eq
(define-fun bool_eq2 ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE ((_ BitVec 64)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) (_ BitVec 64))

;; user_eq
(declare-fun user_eq1 (uns64
  uns64) Bool)

(declare-const dummy1 uns64)

(declare-datatypes ((uns64__ref 0))
  (((uns64__refqtmk (uns64__content uns64)))))

;; uns64__ref_uns64__content__projection
(define-fun uns64__ref_uns64__content__projection ((a uns64__ref)) uns64
  (uns64__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_282 (_ BitVec 64)) (temp___is_init_278 Bool) (temp___skip_constant_279 Bool) (temp___do_toplevel_280 Bool) (temp___do_typ_inv_281 Bool)) Bool
  true)

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg (_ BitVec 64)))
    (! (=>
         (dynamic_invariant arg true true true true)
         (= (big arg) (bv2nat arg))) :pattern ((big arg)) )))

(declare-datatypes ((t__ref1 0))
  (((t__refqtmk1 (t__content1 (_ BitVec 32))))))

;; bool_eq
(define-fun bool_eq3 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (= x y) true false))

;; bool_ne
(define-fun bool_ne1 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (not (= x y)) true false))

;; bool_lt
(define-fun bool_lt1 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvult x y) true false))

;; bool_le
(define-fun bool_le1 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvule x y) true false))

;; bool_gt
(define-fun bool_gt1 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvugt x y) true false))

;; bool_ge
(define-fun bool_ge1 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (bvuge x y) true false))

;; power
(declare-fun power1 ((_ BitVec 32)
  Int) (_ BitVec 32))

;; Power_0
(assert (forall ((x (_ BitVec 32))) (= (power1 x 0) #x00000001)))

;; Power_1
(assert (forall ((x (_ BitVec 32))) (= (power1 x 1) x)))

;; Power_s
(assert
  (forall ((x (_ BitVec 32)) (n Int))
    (=> (<= 0 n) (= (power1 x (+ n 1)) (bvmul x (power1 x n))))))

;; Power_s_alt
(assert
  (forall ((x (_ BitVec 32)) (n Int))
    (=> (< 0 n) (= (power1 x n) (bvmul x (power1 x (- n 1)))))))

;; Power_sum
(assert
  (forall ((x (_ BitVec 32)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power1 x (+ n m)) (bvmul (power1 x n) (power1 x m)))))))

;; Power_mult
(assert
  (forall ((x (_ BitVec 32)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power1 x (* n m)) (power1 (power1 x n) m))))))

;; Power_mult2
(assert
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)) (n Int))
    (=>
      (<= 0 n)
      (= (power1 (bvmul x y) n) (bvmul (power1 x n) (power1 y n))))))

;; bv_min
(define-fun bv_min1 ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
  (ite (bvule x y) x y))

;; bv_max
(define-fun bv_max1 ((x (_ BitVec 32)) (y (_ BitVec 32))) (_ BitVec 32)
  (ite (bvule x y) y x))

;; bv_min_to_uint
(assert
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)))
    (= (bv2nat (bv_min1 x y)) (min (bv2nat x) (bv2nat y)))))

;; bv_max_to_uint
(assert
  (forall ((x (_ BitVec 32)) (y (_ BitVec 32)))
    (= (bv2nat (bv_max1 x y)) (max (bv2nat x) (bv2nat y)))))

;; uc_of_int
(define-fun uc_of_int1 ((x Int)) (_ BitVec 32)
  (ite (<= 0 x) ((_ int2bv 32) x) (bvneg ((_ int2bv 32) (- x)))))

;; uc_to_int
(define-fun uc_to_int1 ((x (_ BitVec 32))) Int
  (ite (= (bool_lt1 x ((_ int2bv 32) two_power_size_minus_one1)) true)
    (bv2nat x)
    (- (bv2nat (bvneg x)))))

(declare-const x (_ BitVec 32))

(declare-const y (_ BitVec 32))

(declare-sort uns32 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 32))

;; bool_eq
(define-fun bool_eq4 ((x1 (_ BitVec 32)) (y1 (_ BitVec 32))) Bool
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
(define-fun dynamic_invariant1 ((temp___expr_296 (_ BitVec 32)) (temp___is_init_292 Bool) (temp___skip_constant_293 Bool) (temp___do_toplevel_294 Bool) (temp___do_typ_inv_295 Bool)) Bool
  true)

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_256 Int) (temp___is_init_252 Bool) (temp___skip_constant_253 Bool) (temp___do_toplevel_254 Bool) (temp___do_typ_inv_255 Bool)) Bool
  true)

;; Assume
(assert (dynamic_invariant1 x true false true true))

;; Assume
(assert (dynamic_invariant1 y true false true true))

;; Goal def'vc
;; File "s-aridou.adb", line 381, characters 0-0
(assert
  (not
  (= (* (big ((_ zero_extend 32) x)) (big ((_ zero_extend 32) y))) (big
                                                                    (bvmul ((_ zero_extend 32) 
                                                                    x) ((_ zero_extend 32) 
                                                                    y))))))

(check-sat)
(exit)
