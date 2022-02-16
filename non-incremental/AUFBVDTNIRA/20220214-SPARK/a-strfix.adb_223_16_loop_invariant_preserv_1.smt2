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

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool) (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool) (temp___do_typ_inv_17 Bool)) Bool
  (=>
    (or (= temp___is_init_14 true) (<= (- 2147483648) 2147483647))
    (in_range1 temp___expr_18)))

(declare-sort positive 0)

;; positive'int
(declare-fun positiveqtint (positive) Int)

;; positive'axiom
(assert
  (forall ((i positive))
    (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

;; in_range
(define-fun in_range2 ((x Int)) Bool
  (and (<= 1 x) (<= x 2147483647)))

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
(declare-fun user_eq1 (positive
  positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
  (((positive__refqtmk (positive__content positive)))))

;; positive__ref_positive__content__projection
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive
  (positive__content a))

(declare-sort character 0)

;; in_range
(define-fun in_range3 ((x Int)) Bool
  (and (<= 0 x) (<= x 255)))

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
(declare-fun user_eq2 (character
  character) Bool)

(declare-const dummy2 character)

(declare-datatypes ((character__ref 0))
  (((character__refqtmk (character__content character)))))

;; character__ref_character__content__projection
(define-fun character__ref_character__content__projection ((a character__ref)) character
  (character__content a))

(declare-datatypes ((character__init_wrapper 0))
  (((character__init_wrapperqtmk (rec__value character)(us_attr__init Bool)))))

;; character__init_wrapper_rec__value__projection
(define-fun character__init_wrapper_rec__value__projection ((a character__init_wrapper)) character
  (rec__value a))

;; character__init_wrapper___attr__init__projection
(define-fun character__init_wrapper___attr__init__projection ((a character__init_wrapper)) Bool
  (us_attr__init a))

(declare-const dummy3 character__init_wrapper)

;; dummy__def
(assert (= (us_attr__init dummy3) false))

(declare-datatypes ((character__init_wrapper__ref 0))
  (((character__init_wrapper__refqtmk
    (character__init_wrapper__content character__init_wrapper)))))

;; character__init_wrapper__ref_character__init_wrapper__content__projection
(define-fun character__init_wrapper__ref_character__init_wrapper__content__projection 
  ((a character__init_wrapper__ref)) character__init_wrapper
  (character__init_wrapper__content a))

;; to_rep
(declare-fun to_rep (character) Int)

;; of_rep
(declare-fun of_rep (Int) character)

;; inversion_axiom
(assert
  (forall ((x character))
    (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
(assert
  (forall ((x character)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                                (of_rep x))) )))

(declare-datatypes ((map__ref 0))
  (((map__refqtmk (map__content (Array Int character))))))

;; slide
(declare-fun slide ((Array Int character)
  Int
  Int) (Array Int character))

;; slide_eq
(assert
  (forall ((a (Array Int character)))
    (forall ((first Int))
      (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
(assert
  (forall ((a (Array Int character)))
    (forall ((old_first Int))
      (forall ((new_first Int))
        (forall ((i Int))
          (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
          (slide
            a
            old_first
            new_first) i)) ))))))

;; const
(declare-fun const1 (character) (Array Int character))

;; const_def
(assert
  (forall ((v character))
    (forall ((i Int))
      (! (= (select (const1 v) i) v) :pattern ((select (const1 v) i)) ))))

;; bool_eq
(define-fun bool_eq4 ((a (Array Int character)) (a__first Int) (a__last Int) (b (Array Int character)) (b__first Int) (b__last Int)) Bool
  (ite (and
         (ite (<= a__first a__last)
           (and
             (<= b__first b__last)
             (= (- a__last a__first) (- b__last b__first)))
           (< b__last b__first))
         (forall ((temp___idx_105 Int))
           (=>
             (and (<= a__first temp___idx_105) (<= temp___idx_105 a__last))
             (= (to_rep (select a temp___idx_105)) (to_rep
                                                     (select b (+ (- b__first a__first) temp___idx_105)))))))
    true
    false))

;; bool_eq_rev
(assert
  (forall ((a (Array Int character)) (b (Array Int character)))
    (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
      (=>
        (= (bool_eq4 b b__first b__last a a__first a__last) true)
        (and
          (ite (<= a__first a__last)
            (and
              (<= b__first b__last)
              (= (- a__last a__first) (- b__last b__first)))
            (< b__last b__first))
          (forall ((temp___idx_105 Int))
            (=>
              (and (<= a__first temp___idx_105) (<= temp___idx_105 a__last))
              (= (to_rep (select a temp___idx_105)) (to_rep
                                                      (select b (+ (- b__first a__first) temp___idx_105)))))))))))

(declare-datatypes ((map__ref1 0))
  (((map__refqtmk1 (map__content1 (Array Int character__init_wrapper))))))

;; slide
(declare-fun slide1 ((Array Int character__init_wrapper)
  Int
  Int) (Array Int character__init_wrapper))

;; slide_eq
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((first Int))
      (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((old_first Int))
      (forall ((new_first Int))
        (forall ((i Int))
          (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
          (slide1
            a
            old_first
            new_first) i)) ))))))

;; const
(declare-fun const2 (character__init_wrapper) (Array Int character__init_wrapper))

;; const_def
(assert
  (forall ((v character__init_wrapper))
    (forall ((i Int))
      (! (= (select (const2 v) i) v) :pattern ((select (const2 v) i)) ))))

;; convert
(declare-fun convert ((Array Int character__init_wrapper)) (Array Int character))

;; convert__def
(assert
  (forall ((a (Array Int character__init_wrapper)))
    (forall ((temp___106 Int))
      (= (to_rep (of_rep (to_rep (rec__value (select a temp___106))))) 
      (to_rep
        (select (convert a) temp___106))))))

;; to_rep
(define-fun to_rep1 ((x integer)) Int
  (integerqtint x))

;; of_rep
(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
(assert
  (forall ((x integer))
    (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
(assert
  (forall ((x integer)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
(assert
  (forall ((x Int))
    (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                                  (of_rep1 x))) )))

(declare-datatypes ((t 0))
  (((tqtmk (rec__first integer)(rec__last integer)))))

;; mk
(declare-fun mk (Int
  Int) t)

;; mk_def
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range1 f)
         (=>
           (in_range1 l)
           (and
             (= (to_rep1 (rec__first (mk f l))) f)
             (= (to_rep1 (rec__last (mk f l))) l)))) :pattern ((mk f l)) )))

;; dynamic_property
(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range1 low)
    (and
      (in_range1 high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
  (((us_tqtmk (elts (Array Int character))(rt t)))))

;; to_array
(define-fun to_array ((a us_t)) (Array Int character)
  (elts a))

;; of_array
(define-fun of_array ((a (Array Int character)) (f Int) (l Int)) us_t
  (us_tqtmk a (mk f l)))

;; first
(define-fun first ((a us_t)) Int
  (to_rep1 (rec__first (rt a))))

;; last
(define-fun last ((a us_t)) Int
  (to_rep1 (rec__last (rt a))))

;; length
(define-fun length ((a us_t)) Int
  (ite (<= (first a) (last a)) (+ (- (last a) (first a)) 1) 0))

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
    (to_rep1 (rec__first (rt x)))
    (to_rep1 (rec__last (rt x)))
    (elts y)
    (to_rep1 (rec__first (rt y)))
    (to_rep1 (rec__last (rt y)))))

;; user_eq
(declare-fun user_eq3 (us_t
  us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((string____ref 0))
  (((string____refqtmk (string____content us_t)))))

;; string____ref_string____content__projection
(define-fun string____ref_string____content__projection ((a string____ref)) us_t
  (string____content a))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_114 us_t) (temp___is_init_110 Bool) (temp___skip_constant_111 Bool) (temp___do_toplevel_112 Bool) (temp___do_typ_inv_113 Bool)) Bool
  (=>
    (not (= temp___skip_constant_111 true))
    (dynamic_property
      1
      2147483647
      (first temp___expr_114)
      (last temp___expr_114))))

;; array_bool_eq
(declare-fun array_bool_eq ((Array Int character__init_wrapper)
  Int
  Int
  (Array Int character__init_wrapper)
  Int
  Int) Bool)

(declare-datatypes ((t1 0))
  (((tqtmk1 (rec__first1 integer)(rec__last1 integer)))))

;; mk
(declare-fun mk1 (Int
  Int) t1)

;; mk_def
(assert
  (forall ((f Int) (l Int))
    (! (=>
         (in_range1 f)
         (=>
           (in_range1 l)
           (and
             (= (to_rep1 (rec__first1 (mk1 f l))) f)
             (= (to_rep1 (rec__last1 (mk1 f l))) l)))) :pattern ((mk1 f l)) )))

;; dynamic_property
(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int) (high Int)) Bool
  (and
    (in_range1 low)
    (and
      (in_range1 high)
      (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t1 0))
  (((us_tqtmk1 (elts1 (Array Int character__init_wrapper))(rt1 t1)))))

;; to_array
(define-fun to_array1 ((a us_t1)) (Array Int character__init_wrapper)
  (elts1 a))

;; of_array
(define-fun of_array1 ((a (Array Int character__init_wrapper)) (f Int) (l Int)) us_t1
  (us_tqtmk1 a (mk1 f l)))

;; first
(define-fun first1 ((a us_t1)) Int
  (to_rep1 (rec__first1 (rt1 a))))

;; last
(define-fun last1 ((a us_t1)) Int
  (to_rep1 (rec__last1 (rt1 a))))

;; length
(define-fun length1 ((a us_t1)) Int
  (ite (<= (first1 a) (last1 a)) (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
(assert (<= 0 value__size1))

;; object__size_axiom
(assert (<= 0 object__size1))

;; component__size_axiom
(assert (<= 0 component__size1))

;; alignment_axiom
(assert (<= 0 alignment1))

;; bool_eq
(define-fun bool_eq6 ((x us_t1) (y us_t1)) Bool
  (array_bool_eq
    (elts1 x)
    (to_rep1 (rec__first1 (rt1 x)))
    (to_rep1 (rec__last1 (rt1 x)))
    (elts1 y)
    (to_rep1 (rec__first1 (rt1 y)))
    (to_rep1 (rec__last1 (rt1 y)))))

;; user_eq
(declare-fun user_eq4 (us_t1
  us_t1) Bool)

(declare-const dummy5 us_t1)

(declare-datatypes ((string____init_wrapper__ref 0))
  (((string____init_wrapper__refqtmk (string____init_wrapper__content us_t1)))))

;; string____init_wrapper__ref_string____init_wrapper__content__projection
(define-fun string____init_wrapper__ref_string____init_wrapper__content__projection 
  ((a string____init_wrapper__ref)) us_t1
  (string____init_wrapper__content a))

(declare-const right us_t)

(declare-const result__ us_t1)

(declare-const r32b Int)

(declare-const r33b Int)

(declare-datatypes ((t26b__init_wrapper__ref 0))
  (((t26b__init_wrapper__refqtmk (t26b__init_wrapper__content us_t1)))))

;; t26b__init_wrapper__ref_t26b__init_wrapper__content__projection
(define-fun t26b__init_wrapper__ref_t26b__init_wrapper__content__projection 
  ((a t26b__init_wrapper__ref)) us_t1
  (t26b__init_wrapper__content a))

(declare-datatypes ((t28b__init_wrapper__ref 0))
  (((t28b__init_wrapper__refqtmk (t28b__init_wrapper__content us_t1)))))

;; t28b__init_wrapper__ref_t28b__init_wrapper__content__projection
(define-fun t28b__init_wrapper__ref_t28b__init_wrapper__content__projection 
  ((a t28b__init_wrapper__ref)) us_t1
  (t28b__init_wrapper__content a))

;; dynamic_property
(define-fun dynamic_property2 ((first_int Int) (last_int Int) (x Int)) Bool
  (and (<= first_int x) (<= x last_int)))

;; bool_eq
(define-fun bool_eq7 ((x Int) (y Int)) Bool
  (ite (= x y) true false))

;; attr__ATTRIBUTE_IMAGE
(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

;; attr__ATTRIBUTE_VALUE__pre_check
(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

;; attr__ATTRIBUTE_VALUE
(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

;; user_eq
(declare-fun user_eq5 (integer
  integer) Bool)

(declare-const dummy6 integer)

(declare-datatypes ((t34b__ref 0))
  (((t34b__refqtmk (t34b__content integer)))))

;; t34b__ref_t34b__content__projection
(define-fun t34b__ref_t34b__content__projection ((a t34b__ref)) integer
  (t34b__content a))

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_53 Int) (temp___is_init_49 Bool) (temp___skip_constant_50 Bool) (temp___do_toplevel_51 Bool) (temp___do_typ_inv_52 Bool)) Bool
  (=>
    (or (= temp___is_init_49 true) (<= 1 2147483647))
    (in_range2 temp___expr_53)))

;; dynamic_invariant
(define-fun dynamic_invariant3 ((temp___expr_88 Int) (temp___is_init_84 Bool) (temp___skip_constant_85 Bool) (temp___do_toplevel_86 Bool) (temp___do_typ_inv_87 Bool)) Bool
  (=> (or (= temp___is_init_84 true) (<= 0 255)) (in_range3 temp___expr_88)))

(declare-const ptr Int)

;; Assume
(assert (dynamic_invariant1 right true false true true))

;; Assume
(assert (dynamic_invariant ptr true false true true))

;; Assume
(assert (dynamic_property 1 2147483647 (first1 result__) (last1 result__)))

;; Assume
(assert (dynamic_invariant1 right true false true true))

;; Assume
(assert
  (and
    (and
      (and
        (and
          (and
            (and (not (= (length right) 0)) (= (first1 result__) 1))
            (<= 0 (last1 result__)))
          (= (mod2 ptr (length right)) 0))
        (and (<= 0 ptr) (<= ptr (- (last1 result__) (length right)))))
      (let ((temp___2444 (of_array1
                           (to_array1 result__)
                           (first1 result__)
                           (+ ptr (length right)))))
        (forall ((temp___2445 Int))
          (=>
            (and
              (<= (first1 temp___2444) temp___2445)
              (<= temp___2445 (last1 temp___2444)))
            (= (us_attr__init (select (to_array1 temp___2444) temp___2445)) true)))))
    (= (let ((temp___2450 (of_array1
                            (to_array1 result__)
                            (+ ptr 1)
                            (+ ptr (length right)))))
         (bool_eq4
           (convert (to_array1 temp___2450))
           (first1 temp___2450)
           (last1 temp___2450)
           (to_array right)
           (first right)
           (last right))) true)))

;; Ensures
(assert (in_range1 (+ ptr 1)))

;; Assume
(assert (= (+ ptr 1) r32b))

;; Assume
(assert (dynamic_invariant r32b true false true true))

;; Ensures
(assert (in_range1 (length right)))

;; Ensures
(assert (in_range1 (+ ptr (length right))))

;; Assume
(assert (= (+ ptr (length right)) r33b))

;; Assume
(assert (dynamic_invariant r33b true false true true))

(declare-const k Int)

;; H
(assert (= k r32b))

;; H
(assert
  (= (and (ite (<= r32b k) true false) (ite (<= k r33b) true false)) true))

(declare-const usf Int)

;; H
(assert (in_range1 (+ ptr 1)))

;; _f'unused'unused
(define-fun usfqtunusedqtunused () Bool
  (ite (forall ((j Int))
         (=>
           (and (<= (+ ptr 1) j) (<= j k))
           (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    right) (+ 
                                                                    (first
                                                                    right) 
                                                                    (mod2
                                                                    (- j 1)
                                                                    (length
                                                                    right))))))))
    true
    false))

;; any'result'unused'unused
(define-fun anyqtresultqtunusedqtunused () Bool
  (ite (forall ((j Int))
         (=>
           (and (<= (+ ptr 1) j) (<= j k))
           (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    right) (+ 
                                                                    (first
                                                                    right) 
                                                                    (mod2
                                                                    (- j 1)
                                                                    (length
                                                                    right))))))))
    true
    false))

(declare-const k1 Int)

;; LoopInvariant
(assert
  (forall ((j Int))
    (=>
      (and (<= (+ ptr 1) j) (<= j k1))
      (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                                 (select 
                                                                 (to_array
                                                                   right) (+ 
                                                                 (first
                                                                   right) 
                                                                 (mod2
                                                                   (- j 1)
                                                                   (length
                                                                    right)))))))))

;; H
(assert
  (= (and (ite (dynamic_property2 r32b r33b k1) true false) (ite (and
                                                                   (<= 
                                                                   r32b 
                                                                   k1)
                                                                   (<= 
                                                                   k1 
                                                                   r33b))
                                                              true
                                                              false)) true))

;; (=)'result'unused'unused
(define-fun lpeqrpqtresultqtunusedqtunused () Bool
  (ite (= k1 r33b) true false))

;; H
(assert (not (= k1 r33b)))

(declare-const k2 Int)

;; H
(assert (= k2 (+ k1 1)))

(declare-const usf1 Int)

;; H
(assert (in_range1 (+ ptr 1)))

;; _f'unused'unused
(define-fun usfqtunusedqtunused1 () Bool
  (ite (forall ((j Int))
         (=>
           (and (<= (+ ptr 1) j) (<= j k2))
           (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    right) (+ 
                                                                    (first
                                                                    right) 
                                                                    (mod2
                                                                    (- j 1)
                                                                    (length
                                                                    right))))))))
    true
    false))

;; any'result'unused'unused
(define-fun anyqtresultqtunusedqtunused1 () Bool
  (ite (forall ((j Int))
         (=>
           (and (<= (+ ptr 1) j) (<= j k2))
           (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                                    (select 
                                                                    (to_array
                                                                    right) (+ 
                                                                    (first
                                                                    right) 
                                                                    (mod2
                                                                    (- j 1)
                                                                    (length
                                                                    right))))))))
    true
    false))

(declare-const j Int)

;; H
(assert (<= (+ ptr 1) j))

;; H
(assert (<= j k2))

;; Goal def'vc
;; File "a-strfix.adb", line 188, characters 0-0
(assert
  (not
  (= (to_rep (rec__value (select (to_array1 result__) j))) (to_rep
                                                             (select 
                                                             (to_array
                                                               right) (+ 
                                                             (first
                                                               right) 
                                                             (mod2
                                                               (- j 1)
                                                               (length right))))))))

(check-sat)
(exit)
