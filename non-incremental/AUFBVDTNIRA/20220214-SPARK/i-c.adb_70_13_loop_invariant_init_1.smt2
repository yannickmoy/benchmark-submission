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

(declare-sort size_t 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 64))

;; bool_eq
(define-fun bool_eq2 ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE1 ((_ BitVec 64)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) (_ BitVec 64))

;; user_eq
(declare-fun user_eq (size_t
  size_t) Bool)

(declare-const dummy size_t)

(declare-datatypes ((size_t__ref 0))
  (((size_t__refqtmk (size_t__content size_t)))))

;; size_t__ref_size_t__content__projection
(define-fun size_t__ref_size_t__content__projection ((a size_t__ref)) size_t
  (size_t__content a))

;; to_rep
(declare-fun to_rep (size_t) (_ BitVec 64))

;; of_rep
(declare-fun of_rep ((_ BitVec 64)) size_t)

;; inversion_axiom
(assert
  (forall ((x size_t)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
(assert true)

;; coerce_axiom
(assert
  (forall ((x (_ BitVec 64)))
    (! (= (to_rep (of_rep x)) x) :pattern ((to_rep (of_rep x))) )))

;; to_int
(define-fun to_int3 ((x size_t)) Int
  (bv2nat (to_rep x)))

;; range_int_axiom
(assert
  (forall ((x size_t))
    (! (uint_in_range (to_int3 x)) :pattern ((to_int3 x)) )))

(declare-sort wchar_t 0)

;; in_range
(define-fun in_range1 ((x Int)) Bool
  (and (<= 0 x) (<= x 65535)))

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
(declare-fun user_eq1 (wchar_t
  wchar_t) Bool)

(declare-const dummy1 wchar_t)

(declare-datatypes ((wchar_t__ref 0))
  (((wchar_t__refqtmk (wchar_t__content wchar_t)))))

;; wchar_t__ref_wchar_t__content__projection
(define-fun wchar_t__ref_wchar_t__content__projection ((a wchar_t__ref)) wchar_t
  (wchar_t__content a))

;; to_rep
(declare-fun to_rep1 (wchar_t) Int)

;; of_rep
(declare-fun of_rep1 (Int) wchar_t)

;; inversion_axiom
(assert
  (forall ((x wchar_t))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
(assert
  (forall ((x wchar_t)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array (_ BitVec 64) wchar_t))))))

;; slide
(declare-fun slide ((Array (_ BitVec 64) wchar_t)
  (_ BitVec 64)
  (_ BitVec 64)) (Array (_ BitVec 64) wchar_t))

;; slide_eq
(assert
  (forall ((a (Array (_ BitVec 64) wchar_t)))
    (forall ((first (_ BitVec 64)))
      (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
(assert
  (forall ((a (Array (_ BitVec 64) wchar_t)))
    (forall ((old_first (_ BitVec 64)))
      (forall ((new_first (_ BitVec 64)))
        (forall ((i (_ BitVec 64)))
          (! (= (select (slide a old_first new_first) i) (select a (bvsub i (bvsub new_first old_first)))) :pattern ((select 
          (slide
            a
            old_first
            new_first) i)) ))))))

;; const
(declare-fun const1 (wchar_t) (Array (_ BitVec 64) wchar_t))

;; const_def
(assert
  (forall ((v wchar_t))
    (forall ((i (_ BitVec 64)))
      (! (= (select (const1 v) i) v) :pattern ((select (const1 v) i)) ))))

;; bool_eq
(define-fun bool_eq4 ((a (Array (_ BitVec 64) wchar_t)) (a__first (_ BitVec 64)) (a__last (_ BitVec 64)) (b (Array (_ BitVec 64) wchar_t)) (b__first (_ BitVec 64)) (b__last (_ BitVec 64))) Bool
  (ite (and
         (ite (bvule a__first a__last)
           (and
             (bvule b__first b__last)
             (= (bvsub a__last a__first) (bvsub b__last b__first)))
           (bvugt b__first b__last))
         (forall ((temp___idx_193 (_ BitVec 64)))
           (=>
             (and
               (bvule a__first temp___idx_193)
               (bvule temp___idx_193 a__last))
             (= (to_rep1 (select a temp___idx_193)) (to_rep1
                                                      (select b (bvadd (bvsub b__first a__first) temp___idx_193)))))))
    true
    false))

;; bool_eq_rev
(assert
  (forall ((a (Array (_ BitVec 64) wchar_t)) (b (Array (_ BitVec 64) wchar_t)))
    (forall ((a__first (_ BitVec 64)) (a__last (_ BitVec 64)) (b__first (_ BitVec 64)) (b__last (_ BitVec 64)))
      (=>
        (= (bool_eq4 b b__first b__last a a__first a__last) true)
        (and
          (ite (bvule a__first a__last)
            (and
              (bvule b__first b__last)
              (= (bvsub a__last a__first) (bvsub b__last b__first)))
            (bvugt b__first b__last))
          (forall ((temp___idx_193 (_ BitVec 64)))
            (=>
              (and
                (bvule a__first temp___idx_193)
                (bvule temp___idx_193 a__last))
              (= (to_rep1 (select a temp___idx_193)) (to_rep1
                                                       (select b (bvadd (bvsub b__first a__first) temp___idx_193)))))))))))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first size_t)(rec__last size_t)))))

;; mk
(declare-fun mk ((_ BitVec 64)
  (_ BitVec 64)) t)

;; mk_def
(assert
  (forall ((f (_ BitVec 64)) (l (_ BitVec 64)))
    (! (and
         (= (to_rep (rec__first (mk f l))) f)
         (= (to_rep (rec__last (mk f l))) l)) :pattern ((mk f l)) )))

;; dynamic_property
(define-fun dynamic_property ((range_first (_ BitVec 64)) (range_last (_ BitVec 64)) (low (_ BitVec 64)) (high (_ BitVec 64))) Bool
  true)

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array (_ BitVec 64) wchar_t))(rt t)))))

;; to_array
(define-fun to_array ((a us_t)) (Array (_ BitVec 64) wchar_t)
  (elts a))

;; of_array
(define-fun of_array ((a (Array (_ BitVec 64) wchar_t)) (f (_ BitVec 64)) (l (_ BitVec 64))) us_t
  (us_tqtmk a (mk f l)))

;; first
(define-fun first ((a us_t)) (_ BitVec 64)
  (to_rep (rec__first (rt a))))

;; last
(define-fun last ((a us_t)) (_ BitVec 64)
  (to_rep (rec__last (rt a))))

;; length
(define-fun length ((a us_t)) Int
  (ite (bvule (first a) (last a))
    (+ (- (bv2nat (last a)) (bv2nat (first a))) 1)
    0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
(assert (<= 0 value__size))

;; object__size_axiom
(assert (<= 0 object__size))

;; component__size_axiom
(assert (<= 0 component__size))

;; alignment_axiom
(assert (<= 0 alignment))

;; bool_eq
(define-fun bool_eq5 ((x us_t) (y us_t)) Bool
  (bool_eq4
    (elts x)
    (to_rep (rec__first (rt x)))
    (to_rep (rec__last (rt x)))
    (elts y)
    (to_rep (rec__first (rt y)))
    (to_rep (rec__last (rt y)))))

;; user_eq
(declare-fun user_eq2 (us_t
  us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((wchar_array__ref 0))
  (((wchar_array__refqtmk (wchar_array__content us_t)))))

;; wchar_array__ref_wchar_array__content__projection
(define-fun wchar_array__ref_wchar_array__content__projection ((a wchar_array__ref)) us_t
  (wchar_array__content a))

;; is_nul_terminated
(declare-fun is_nul_terminated (us_t) Bool)

;; is_nul_terminated__function_guard
(declare-fun is_nul_terminated__function_guard (Bool
  us_t) Bool)

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_428 us_t) (temp___is_init_424 Bool) (temp___skip_constant_425 Bool) (temp___do_toplevel_426 Bool) (temp___do_typ_inv_427 Bool)) Bool
  (=>
    (not (= temp___skip_constant_425 true))
    (dynamic_property
      #x0000000000000000
      #xFFFFFFFFFFFFFFFF
      (first temp___expr_428)
      (last temp___expr_428))))

;; is_nul_terminated__post_axiom
(assert
  (forall ((item us_t))
    (! (=>
         (dynamic_invariant item true true true true)
         (let ((result (is_nul_terminated item)))
           (=>
             (is_nul_terminated__function_guard result item)
             (=
               (= result true)
               (exists ((temp___432 (_ BitVec 64)))
                 (and
                   (and
                     (bvule (first item) temp___432)
                     (bvule temp___432 (last item)))
                   (= (to_rep1 (select (to_array item) temp___432)) 0))))))) :pattern (
    (is_nul_terminated
      item)) )))

(declare-const item us_t)

(declare-const attr__ATTRIBUTE_MODULUS1 (_ BitVec 64))

;; dynamic_property
(define-fun dynamic_property1 ((first_int (_ BitVec 64)) (last_int (_ BitVec 64)) (x (_ BitVec 64))) Bool
  (and (bvule first_int x) (bvule x last_int)))

;; dynamic_property_int
(define-fun dynamic_property_int ((first_int Int) (last_int Int) (x Int)) Bool
  (and (<= first_int x) (<= x last_int)))

;; bool_eq
(define-fun bool_eq6 ((x (_ BitVec 64)) (y (_ BitVec 64))) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 64)) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 64))

;; user_eq
(declare-fun user_eq3 (size_t
  size_t) Bool)

(declare-const dummy3 size_t)

(declare-datatypes ((t9b__ref 0))
  (((t9b__refqtmk (t9b__content size_t)))))

;; t9b__ref_t9b__content__projection
(define-fun t9b__ref_t9b__content__projection ((a t9b__ref)) size_t
  (t9b__content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_312 (_ BitVec 64)) (temp___is_init_308 Bool) (temp___skip_constant_309 Bool) (temp___do_toplevel_310 Bool) (temp___do_typ_inv_311 Bool)) Bool
  true)

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_421 Int) (temp___is_init_417 Bool) (temp___skip_constant_418 Bool) (temp___do_toplevel_419 Bool) (temp___do_typ_inv_420 Bool)) Bool
  (=>
    (or (= temp___is_init_417 true) (<= 0 65535))
    (in_range1 temp___expr_421)))

;; Assume
(assert (dynamic_invariant item true false true true))

;; Assume
(assert
  (and
    (is_nul_terminated__function_guard (is_nul_terminated item) item)
    (= (is_nul_terminated item) true)))

(declare-const j (_ BitVec 64))

;; H
(assert (= j (first item)))

;; H
(assert
  (= (and (ite (bvule (first item) j) true false) (ite (bvule j (last item))
                                                    true
                                                    false)) true))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused () Bool
  (ite (= (to_rep1 (select (to_array item) j)) 0) true false))

(declare-const spark__branch Bool)

;; H
(assert
  (= spark__branch (ite (= (to_rep1 (select (to_array item) j)) 0)
                     true
                     false)))

;; H
(assert (not (= spark__branch true)))

;; _f'unused'unused
(define-fun usfqtunusedqtunused () Bool
  (ite (forall ((k (_ BitVec 64)))
         (=>
           (and (bvule (first item) k) (bvule k j))
           (not (= (to_rep1 (select (to_array item) k)) 0))))
    true
    false))

;; any'result'unused'unused
(define-fun anyqtresultqtunusedqtunused () Bool
  (ite (forall ((k (_ BitVec 64)))
         (=>
           (and (bvule (first item) k) (bvule k j))
           (not (= (to_rep1 (select (to_array item) k)) 0))))
    true
    false))

(declare-const k (_ BitVec 64))

;; H
(assert (bvule (first item) k))

;; H
(assert (bvule k j))

;; Goal def'vc
;; File "i-c.ads", line 268, characters 0-0
(assert
  (not (not (= (to_rep1 (select (to_array item) k)) 0))))

(check-sat)
(exit)
