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

;; nth
(declare-fun nth1 ((_ BitVec 128)
  Int) Bool)

;; lsr
(declare-fun lsr1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; asr
(declare-fun asr1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; lsl
(declare-fun lsl1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; rotate_right
(declare-fun rotate_right2 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; rotate_left
(declare-fun rotate_left2 ((_ BitVec 128)
  Int) (_ BitVec 128))

(declare-const two_power_size_minus_one1 Int)

;; two_power_size_minus_one_val
(assert (= two_power_size_minus_one1 (pow2 (- 128 1))))

;; to_int
(define-fun to_int2 ((x (_ BitVec 128))) Int
  (ite (bvsge x (_ bv0 128))
    (bv2nat x)
    (- (- 340282366920938463463374607431768211456 (bv2nat x)))))

;; uint_in_range
(define-fun uint_in_range1 ((i Int)) Bool
  (and (<= 0 i) (<= i 340282366920938463463374607431768211455)))

;; lsr_bv_is_lsr
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvlshr x n) (lsr1 x (bv2nat n)))))

;; asr_bv_is_asr
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvashr x n) (asr1 x (bv2nat n)))))

;; lsl_bv_is_lsl
(assert
  (forall ((x (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvshl x n) (lsl1 x (bv2nat n)))))

;; rotate_left_bv_is_rotate_left
(assert
  (forall ((v (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvor (bvshl v (bvurem n (_ bv128 128))) (bvlshr v (bvsub (_ bv128 128) (bvurem n (_ bv128 128))))) 
    (rotate_left2
      v
      (bv2nat n)))))

;; rotate_right_bv_is_rotate_right
(assert
  (forall ((v (_ BitVec 128)) (n (_ BitVec 128)))
    (= (bvor (bvlshr v (bvurem n (_ bv128 128))) (bvshl v (bvsub (_ bv128 128) (bvurem n (_ bv128 128))))) 
    (rotate_right2
      v
      (bv2nat n)))))

;; nth_bv
(declare-fun nth_bv1 ((_ BitVec 128)
  (_ BitVec 128)) Bool)

;; nth_bv_def
(assert
  (forall ((x (_ BitVec 128)) (i (_ BitVec 128)))
    (=
      (= (nth_bv1 x i) true)
      (not
        (= (bvand (bvlshr x i) #x00000000000000000000000000000001) #x00000000000000000000000000000000)))))

;; Nth_bv_is_nth
(assert
  (forall ((x (_ BitVec 128)) (i (_ BitVec 128)))
    (= (nth1 x (bv2nat i)) (nth_bv1 x i))))

;; Nth_bv_is_nth2
(assert
  (forall ((x (_ BitVec 128)) (i Int))
    (=>
      (and (<= 0 i) (< i 340282366920938463463374607431768211456))
      (= (nth_bv1 x ((_ int2bv 128) i)) (nth1 x i)))))

;; eq_sub_bv
(declare-fun eq_sub_bv1 ((_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 128)) Bool)

;; eq_sub_bv_def
(assert
  (forall ((a (_ BitVec 128)) (b (_ BitVec 128)) (i (_ BitVec 128)) (n (_ BitVec 128)))
    (let ((mask (bvshl (bvsub (bvshl #x00000000000000000000000000000001 n) #x00000000000000000000000000000001) i)))
      (= (eq_sub_bv1 a b i n) (= (bvand b mask) (bvand a mask))))))

;; eq_sub
(define-fun eq_sub1 ((a (_ BitVec 128)) (b (_ BitVec 128)) (i Int) (n Int)) Bool
  (forall ((j Int))
    (=> (and (<= i j) (< j (+ i n))) (= (nth1 a j) (nth1 b j)))))

;; eq_sub_equiv
(assert
  (forall ((a (_ BitVec 128)) (b (_ BitVec 128)) (i (_ BitVec 128)) (n (_ BitVec 128)))
    (= (eq_sub1 a b (bv2nat i) (bv2nat n)) (eq_sub_bv1 a b i n))))

(declare-datatypes ((t__ref1 0))
  (((t__refqtmk1 (t__content1 (_ BitVec 128))))))

;; bool_eq
(define-fun bool_eq1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (= x y) true false))

;; bool_ne
(define-fun bool_ne1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (not (= x y)) true false))

;; bool_lt
(define-fun bool_lt1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvult x y) true false))

;; bool_le
(define-fun bool_le1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvule x y) true false))

;; bool_gt
(define-fun bool_gt1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvugt x y) true false))

;; bool_ge
(define-fun bool_ge1 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (bvuge x y) true false))

;; power
(declare-fun power1 ((_ BitVec 128)
  Int) (_ BitVec 128))

;; Power_0
(assert
  (forall ((x (_ BitVec 128)))
    (= (power1 x 0) #x00000000000000000000000000000001)))

;; Power_1
(assert (forall ((x (_ BitVec 128))) (= (power1 x 1) x)))

;; Power_s
(assert
  (forall ((x (_ BitVec 128)) (n Int))
    (=> (<= 0 n) (= (power1 x (+ n 1)) (bvmul x (power1 x n))))))

;; Power_s_alt
(assert
  (forall ((x (_ BitVec 128)) (n Int))
    (=> (< 0 n) (= (power1 x n) (bvmul x (power1 x (- n 1)))))))

;; Power_sum
(assert
  (forall ((x (_ BitVec 128)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power1 x (+ n m)) (bvmul (power1 x n) (power1 x m)))))))

;; Power_mult
(assert
  (forall ((x (_ BitVec 128)) (n Int) (m Int))
    (=>
      (<= 0 n)
      (=> (<= 0 m) (= (power1 x (* n m)) (power1 (power1 x n) m))))))

;; Power_mult2
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)) (n Int))
    (=>
      (<= 0 n)
      (= (power1 (bvmul x y) n) (bvmul (power1 x n) (power1 y n))))))

;; bv_min
(define-fun bv_min1 ((x (_ BitVec 128)) (y (_ BitVec 128))) (_ BitVec 128)
  (ite (bvule x y) x y))

;; bv_max
(define-fun bv_max1 ((x (_ BitVec 128)) (y (_ BitVec 128))) (_ BitVec 128)
  (ite (bvule x y) y x))

;; bv_min_to_uint
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)))
    (= (bv2nat (bv_min1 x y)) (min (bv2nat x) (bv2nat y)))))

;; bv_max_to_uint
(assert
  (forall ((x (_ BitVec 128)) (y (_ BitVec 128)))
    (= (bv2nat (bv_max1 x y)) (max (bv2nat x) (bv2nat y)))))

;; uc_of_int
(define-fun uc_of_int1 ((x Int)) (_ BitVec 128)
  (ite (<= 0 x) ((_ int2bv 128) x) (bvneg ((_ int2bv 128) (- x)))))

;; uc_to_int
(define-fun uc_to_int1 ((x (_ BitVec 128))) Int
  (ite (= (bool_lt1 x ((_ int2bv 128) two_power_size_minus_one1)) true)
    (bv2nat x)
    (- (bv2nat (bvneg x)))))

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

(declare-sort int128 0)

;; int128'int
(declare-fun int128qtint (int128) Int)

;; int128'axiom
(assert
  (forall ((i int128))
    (and
      (<= (- 170141183460469231731687303715884105728) (int128qtint i))
      (<= (int128qtint i) 170141183460469231731687303715884105727))))

;; in_range
(define-fun in_range ((x Int)) Bool
  (and
    (<= (- 170141183460469231731687303715884105728) x)
    (<= x 170141183460469231731687303715884105727)))

;; bool_eq
(define-fun bool_eq3 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

;; user_eq
(declare-fun user_eq1 (int128
  int128) Bool)

(declare-const dummy1 int128)

(declare-datatypes ((int128__ref 0))
  (((int128__refqtmk (int128__content int128)))))

;; int128__ref_int128__content__projection
(define-fun int128__ref_int128__content__projection ((a int128__ref)) int128
  (int128__content a))

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_235 Int) (temp___is_init_231 Bool) (temp___skip_constant_232 Bool) (temp___do_toplevel_233 Bool) (temp___do_typ_inv_234 Bool)) Bool
  (=>
    (or
      (= temp___is_init_231 true)
      (<= (- 170141183460469231731687303715884105728) 170141183460469231731687303715884105727))
    (in_range temp___expr_235)))

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg Int))
    (! (=> (dynamic_invariant arg true true true true) (= (big arg) arg)) :pattern (
    (big
      arg)) )))

;; big
(declare-fun big1 ((_ BitVec 128)) Int)

;; big__function_guard
(declare-fun big__function_guard1 (Int
  (_ BitVec 128)) Bool)

(declare-sort uns128 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 128))

;; bool_eq
(define-fun bool_eq4 ((x (_ BitVec 128)) (y (_ BitVec 128))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 128)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 128))

;; user_eq
(declare-fun user_eq2 (uns128
  uns128) Bool)

(declare-const dummy2 uns128)

(declare-datatypes ((uns128__ref 0))
  (((uns128__refqtmk (uns128__content uns128)))))

;; uns128__ref_uns128__content__projection
(define-fun uns128__ref_uns128__content__projection ((a uns128__ref)) uns128
  (uns128__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_282 (_ BitVec 128)) (temp___is_init_278 Bool) (temp___skip_constant_279 Bool) (temp___do_toplevel_280 Bool) (temp___do_typ_inv_281 Bool)) Bool
  true)

;; big__post_axiom
(assert true)

;; big__def_axiom
(assert
  (forall ((arg (_ BitVec 128)))
    (! (=>
         (dynamic_invariant1 arg true true true true)
         (= (big1 arg) (bv2nat arg))) :pattern ((big1 arg)) )))

(declare-const x Int)

(declare-const y Int)

(declare-const z Int)

(declare-const big_2xxsingle Int)

;; odivide
(define-fun odivide ((a (_ BitVec 128)) (b (_ BitVec 64))) (_ BitVec 128)
  (bvudiv a ((_ zero_extend 64) b)))

;; odivide__function_guard
(declare-fun odivide__function_guard ((_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 64)) Bool)

;; oconcat
(declare-fun oconcat ((_ BitVec 64)
  (_ BitVec 64)) (_ BitVec 128))

;; oconcat__function_guard
(declare-fun oconcat__function_guard ((_ BitVec 128)
  (_ BitVec 64)
  (_ BitVec 64)) Bool)

(declare-sort uns64 0)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

;; bool_eq
(define-fun bool_eq5 ((x1 (_ BitVec 64)) (y1 (_ BitVec 64))) Bool
  (ite (= x1 y1) true false))

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
(define-fun dynamic_invariant2 ((temp___expr_296 (_ BitVec 64)) (temp___is_init_292 Bool) (temp___skip_constant_293 Bool) (temp___do_toplevel_294 Bool) (temp___do_typ_inv_295 Bool)) Bool
  true)

;; oconcat__post_axiom
(assert
  (forall ((hi (_ BitVec 64)) (lo (_ BitVec 64)))
    (! (=>
         (and
           (dynamic_invariant2 hi true true true true)
           (dynamic_invariant2 lo true true true true))
         (let ((result (oconcat hi lo)))
           (=>
             (oconcat__function_guard result hi lo)
             (dynamic_invariant1 result true false true true)))) :pattern (
    (oconcat
      hi
      lo)) )))

;; oconcat__def_axiom
(assert
  (forall ((hi (_ BitVec 64)) (lo (_ BitVec 64)))
    (! (=>
         (and
           (dynamic_invariant2 hi true true true true)
           (dynamic_invariant2 lo true true true true))
         (= (oconcat hi lo) (bvor (bvshl ((_ zero_extend 64) hi) ((_ int2bv 128) 64)) ((_ zero_extend 64) lo)))) :pattern (
    (oconcat
      hi
      lo)) )))

;; oabs
(define-fun oabs ((x1 Int)) (_ BitVec 128)
  (ite (= x1 (- 170141183460469231731687303715884105728))
    #x80000000000000000000000000000000
    ((_ int2bv 128) (abs1 x1))))

;; oabs__function_guard
(declare-fun oabs__function_guard ((_ BitVec 128)
  Int) Bool)

;; orem
(define-fun orem ((a (_ BitVec 128)) (b (_ BitVec 64))) (_ BitVec 128)
  (bvurem a ((_ zero_extend 64) b)))

;; orem__function_guard
(declare-fun orem__function_guard ((_ BitVec 128)
  (_ BitVec 128)
  (_ BitVec 64)) Bool)

;; lo
(define-fun lo ((a (_ BitVec 128))) (_ BitVec 64)
  ((_ extract 63 0) (bvand a #x0000000000000000FFFFFFFFFFFFFFFF)))

;; lo__function_guard
(declare-fun lo__function_guard ((_ BitVec 64)
  (_ BitVec 128)) Bool)

;; hi
(declare-fun hi ((_ BitVec 128)) (_ BitVec 64))

;; hi__function_guard
(declare-fun hi__function_guard ((_ BitVec 64)
  (_ BitVec 128)) Bool)

;; hi__post_axiom
(assert
  (forall ((a (_ BitVec 128)))
    (! (=>
         (dynamic_invariant1 a true true true true)
         (let ((result (hi a)))
           (=>
             (hi__function_guard result a)
             (dynamic_invariant2 result true false true true)))) :pattern (
    (hi
      a)) )))

;; hi__def_axiom
(assert
  (forall ((a (_ BitVec 128)))
    (! (=>
         (dynamic_invariant1 a true true true true)
         (= (hi a) ((_ extract 63 0) (bvlshr a ((_ int2bv 128) 64))))) :pattern (
    (hi
      a)) )))

(declare-datatypes ((uns64__init_wrapper 0))
  (((uns64__init_wrapperqtmk (rec__value uns64)(us_attr__init Bool)))))

;; uns64__init_wrapper_rec__value__projection
(define-fun uns64__init_wrapper_rec__value__projection ((a uns64__init_wrapper)) uns64
  (rec__value a))

;; uns64__init_wrapper___attr__init__projection
(define-fun uns64__init_wrapper___attr__init__projection ((a uns64__init_wrapper)) Bool
  (us_attr__init a))

(declare-const dummy4 uns64__init_wrapper)

;; dummy__def
(assert (= (us_attr__init dummy4) false))

(declare-datatypes ((uns64__init_wrapper__ref 0))
  (((uns64__init_wrapper__refqtmk
    (uns64__init_wrapper__content uns64__init_wrapper)))))

;; uns64__init_wrapper__ref_uns64__init_wrapper__content__projection
(define-fun uns64__init_wrapper__ref_uns64__init_wrapper__content__projection 
  ((a uns64__init_wrapper__ref)) uns64__init_wrapper
  (uns64__init_wrapper__content a))

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array Int uns64__init_wrapper))))))

;; slide
(declare-fun slide ((Array Int uns64__init_wrapper)
  Int
  Int) (Array Int uns64__init_wrapper))

;; slide_eq
(assert
  (forall ((a (Array Int uns64__init_wrapper)))
    (forall ((first Int))
      (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
(assert
  (forall ((a (Array Int uns64__init_wrapper)))
    (forall ((old_first Int))
      (forall ((new_first Int))
        (forall ((i Int))
          (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
          (slide
            a
            old_first
            new_first) i)) ))))))

;; const
(declare-fun const1 (uns64__init_wrapper) (Array Int uns64__init_wrapper))

;; const_def
(assert
  (forall ((v uns64__init_wrapper))
    (forall ((i Int))
      (! (= (select (const1 v) i) v) :pattern ((select (const1 v) i)) ))))

(declare-const mult Int)

;; to_rep
(declare-fun to_rep (uns64) (_ BitVec 64))

;; of_rep
(declare-fun of_rep ((_ BitVec 64)) uns64)

;; inversion_axiom
(assert
  (forall ((x1 uns64))
    (! (= (of_rep (to_rep x1)) x1) :pattern ((to_rep x1)) )))

;; range_axiom
(assert true)

;; coerce_axiom
(assert
  (forall ((x1 (_ BitVec 64)))
    (! (= (to_rep (of_rep x1)) x1) :pattern ((to_rep (of_rep x1))) )))

;; to_int
(define-fun to_int3 ((x1 uns64)) Int
  (bv2nat (to_rep x1)))

;; range_int_axiom
(assert
  (forall ((x1 uns64))
    (! (uint_in_range (to_int3 x1)) :pattern ((to_int3 x1)) )))

(declare-sort tdD1 0)

;; tdD1'int
(declare-fun tdD1qtint (tdD1) Int)

;; tdD1'axiom
(assert (forall ((i tdD1)) (and (<= 1 (tdD1qtint i)) (<= (tdD1qtint i) 4))))

;; in_range
(define-fun in_range1 ((x1 Int)) Bool
  (and (<= 1 x1) (<= x1 4)))

;; bool_eq
(define-fun bool_eq6 ((x1 Int) (y1 Int)) Bool
  (ite (= x1 y1) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

;; user_eq
(declare-fun user_eq4 (tdD1
  tdD1) Bool)

(declare-const dummy5 tdD1)

(declare-datatypes ((tdD1__ref 0))
  (((tdD1__refqtmk (tdD1__content tdD1)))))

;; tdD1__ref_tdD1__content__projection
(define-fun tdD1__ref_tdD1__content__projection ((a tdD1__ref)) tdD1
  (tdD1__content a))

;; dynamic_invariant
(define-fun dynamic_invariant3 ((temp___expr_256 Int) (temp___is_init_252 Bool) (temp___skip_constant_253 Bool) (temp___do_toplevel_254 Bool) (temp___do_typ_inv_255 Bool)) Bool
  true)

;; big_2xxsingle__def_axiom
(assert (= big_2xxsingle (big 18446744073709551616)))

;; mult__def_axiom
(assert (= mult (abs1 (* (big x) (big y)))))

(declare-const zlo (_ BitVec 64))

(declare-const d (Array Int uns64__init_wrapper))

(declare-const qu (_ BitVec 128))

(declare-const ru (_ BitVec 128))

(declare-const t1 (_ BitVec 128))

(declare-const t2 (_ BitVec 128))

(declare-const quot Int)

(declare-const big_r Int)

;; Assume
(assert (dynamic_invariant x true false true true))

;; Assume
(assert (dynamic_invariant y true false true true))

;; Assume
(assert (dynamic_invariant z true false true true))

;; Assume
(assert true)

;; Assume
(assert (= (big 18446744073709551616) big_2xxsingle))

;; Assume
(assert (dynamic_invariant x true false true true))

;; Assume
(assert (dynamic_invariant y true false true true))

;; Assume
(assert (dynamic_invariant z true false true true))

;; Assume
(assert (dynamic_invariant2 zlo true false true true))

;; Assume
(assert (dynamic_invariant1 qu true false true true))

;; Assume
(assert (dynamic_invariant1 ru true false true true))

;; Assume
(assert (dynamic_invariant1 t1 true false true true))

;; Assume
(assert (dynamic_invariant1 t2 true false true true))

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
            (and
              (and
                (and
                  (and
                    (and
                      (and
                        (not (= z 0))
                        (forall ((temp___2567 Int))
                          (=>
                            (and (<= 1 temp___2567) (<= temp___2567 4))
                            (= (us_attr__init (select d temp___2567)) true))))
                      (and
                        (hi__function_guard (hi (oabs z)) (oabs z))
                        (= (hi (oabs z)) #x0000000000000000)))
                    (= (lo (oabs z)) zlo))
                  (= mult (+ (+ (* (* big_2xxsingle big_2xxsingle) (big1
                                                                    ((_ zero_extend 64) 
                                                                    (to_rep
                                                                    (rec__value
                                                                    (select 
                                                                    d 2)))))) (* 
                  big_2xxsingle (big1
                                  ((_ zero_extend 64) (to_rep
                                                        (rec__value
                                                          (select d 3))))))) 
                  (big1
                    ((_ zero_extend 64) (to_rep (rec__value (select d 4))))))))
                (bvult (to_rep (rec__value (select d 2))) zlo))
              (= quot (div1 (* (big x) (big y)) (big z))))
            (= big_r (mod1 (* (big x) (big y)) (big z))))
          (and
            (oconcat__function_guard
              (oconcat
                (to_rep (rec__value (select d 2)))
                (to_rep (rec__value (select d 3))))
              (to_rep (rec__value (select d 2)))
              (to_rep (rec__value (select d 3))))
            (= t1 (oconcat
                    (to_rep (rec__value (select d 2)))
                    (to_rep (rec__value (select d 3)))))))
        (and
          (oconcat__function_guard
            (oconcat (lo (orem t1 zlo)) (to_rep (rec__value (select d 4))))
            (lo (orem t1 zlo))
            (to_rep (rec__value (select d 4))))
          (= t2 (oconcat
                  (lo (orem t1 zlo))
                  (to_rep (rec__value (select d 4)))))))
      (and
        (oconcat__function_guard
          (oconcat (lo (odivide t1 zlo)) (lo (odivide t2 zlo)))
          (lo (odivide t1 zlo))
          (lo (odivide t2 zlo)))
        (= qu (oconcat (lo (odivide t1 zlo)) (lo (odivide t2 zlo))))))
    (= ru (orem t2 zlo))))

;; Goal def'vc
;; File "s-aridou.adb", line 1852, characters 0-0
(assert
  (not (= (big1 qu) (abs1 quot))))

(check-sat)
(exit)
