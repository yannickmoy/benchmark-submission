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
(define-fun bool_eq1 ((x Bool) (y Bool)) Bool
  (ite (= x y) true false))

;; to_int
(define-fun to_int2 ((b Bool)) Int
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
(define-fun bool_eq2 ((x Int) (y Int)) Bool
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

(declare-sort natural 0)

;; natural'int
(declare-fun naturalqtint (natural) Int)

;; natural'axiom
(assert
  (forall ((i natural))
    (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

;; in_range
(define-fun in_range2 ((x Int)) Bool
  (and (<= 0 x) (<= x 2147483647)))

;; bool_eq
(define-fun bool_eq3 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

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
(define-fun dynamic_invariant ((temp___expr_46 Int) (temp___is_init_42 Bool) (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool) (temp___do_typ_inv_45 Bool)) Bool
  (=>
    (or (= temp___is_init_42 true) (<= 0 2147483647))
    (in_range2 temp___expr_46)))

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

(declare-const big_10 Int)

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
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

;; max_log10
(define-fun max_log10 ((us_void_param tuple0)) Int
  (ite (= 32 8)
    2
    (ite (= 32 16)
      4
      (ite true 9 (ite (= 32 64) 19 (ite (= 32 128) 38 (to_rep dummy1)))))))

;; max_log10__function_guard
(declare-fun max_log10__function_guard (Int
  tuple0) Bool)

(declare-const lo (_ BitVec 32))

(declare-const hi (_ BitVec 32))

(declare-const max_w Int)

(declare-const t_init (_ BitVec 32))

(declare-sort unsigned 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 32))

;; bool_eq
(define-fun bool_eq5 ((x (_ BitVec 32)) (y (_ BitVec 32))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 32)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 32))

;; user_eq
(declare-fun user_eq3 (unsigned
  unsigned) Bool)

(declare-const dummy3 unsigned)

(declare-datatypes ((unsigned__ref 0))
  (((unsigned__refqtmk (unsigned__content unsigned)))))

;; unsigned__ref_unsigned__content__2__projection
(define-fun unsigned__ref_unsigned__content__2__projection ((a unsigned__ref)) unsigned
  (unsigned__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_184 (_ BitVec 32)) (temp___is_init_180 Bool) (temp___skip_constant_181 Bool) (temp___do_toplevel_182 Bool) (temp___do_typ_inv_183 Bool)) Bool
  true)

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool) (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool) (temp___do_typ_inv_17 Bool)) Bool
  (=>
    (or (= temp___is_init_14 true) (<= (- 2147483648) 2147483647))
    (in_range1 temp___expr_18)))

;; dynamic_invariant
(define-fun dynamic_invariant3 ((temp___expr_198 Int) (temp___is_init_194 Bool) (temp___skip_constant_195 Bool) (temp___do_toplevel_196 Bool) (temp___do_typ_inv_197 Bool)) Bool
  true)

;; big_10__def_axiom
(assert (= big_10 (bv2nat #x0000000A)))

;; max_w__def_axiom
(assert (= max_w (max_log10 Tuple0)))

;; t_init__def_axiom
(assert (= t_init (bv_max lo hi)))

(declare-const w Int)

(declare-const t (_ BitVec 32))

;; Assume
(assert true)

;; Assume
(assert (= 10 big_10))

;; Assume
(assert (dynamic_invariant1 lo true false true true))

;; Assume
(assert (dynamic_invariant1 hi true false true true))

(declare-const ada___system__wid_uns__width_uns__width__result Int)

;; Assume
(assert true)

;; Assume
(assert (dynamic_invariant w false false true true))

;; Assume
(assert true)

;; Assume
(assert (dynamic_invariant1 t false false true true))

;; H
(assert (dynamic_invariant (max_log10 Tuple0) true false true true))

;; H
(assert
  (= (max_log10 Tuple0) (ite (= 32 8)
                          2
                          (ite (= 32 16)
                            4
                            (ite true
                              9
                              (ite (= 32 64)
                                19
                                (ite (= 32 128) 38 (to_rep dummy1))))))))

;; H
(assert (= (max_log10 Tuple0) max_w))

;; H
(assert (dynamic_invariant max_w true false true true))

(declare-const pow Int)

;; H
(assert (= pow 1))

;; H
(assert true)

;; H
(assert true)

;; H
(assert (let ((o hi)) (let ((o1 lo)) (= (ite (bvule o1 o) o o1) t_init))))

;; H
(assert (dynamic_invariant1 t_init true false true true))

(declare-const spark__branch Bool)

;; H
(assert (= spark__branch (ite (bvugt lo hi) true false)))

(declare-const w1 Int)

(declare-const t1 (_ BitVec 32))

(declare-const w2 Int)

;; H
(assert
  (ite (= spark__branch true)
    (= ada___system__wid_uns__width_uns__width__result 0)
    (and
      (= w1 2)
      (let ((o hi))
        (let ((o1 lo))
          (and
            (= t1 (ite (bvule o1 o) o o1))
            (and
              (ite (bvuge t1 #x0000000A)
                (exists ((t2 (_ BitVec 32)))
                  (and
                    (= t2 (bvudiv t1 #x0000000A))
                    (let ((o2 (+ w1 1)))
                      (and
                        (in_range1 o2)
                        (exists ((w3 Int))
                          (and
                            (= w3 o2)
                            (exists ((pow1 Int))
                              (and
                                (= pow1 (* pow 10))
                                (and
                                  (in_range1 (+ max_w 2))
                                  (exists ((t3 (_ BitVec 32)) (pow3 Int))
                                    (and
                                      (and
                                        (and (<= 3 w2) (<= w2 (+ max_w 2)))
                                        (and
                                          (= pow3 (power big_10 (- w2 2)))
                                          (= (bv2nat t3) (div1
                                                           (bv2nat t_init)
                                                           pow3))))
                                      (and
                                        (and
                                          (dynamic_invariant
                                            w2
                                            false
                                            true
                                            true
                                            true)
                                          (dynamic_invariant1
                                            t3
                                            false
                                            true
                                            true
                                            true))
                                        (not (bvuge t3 #x0000000A))))))))))))))
                (= w2 w1))
              (= ada___system__wid_uns__width_uns__width__result w2))))))))

;; Goal def'vc
;; File "s-widthu.ads", line 75, characters 0-0
(assert
  (not
  (=>
    (not (bvugt lo hi))
    (< (bv2nat hi) (power
                     big_10
                     (- ada___system__wid_uns__width_uns__width__result 1))))))

(check-sat)
(exit)
