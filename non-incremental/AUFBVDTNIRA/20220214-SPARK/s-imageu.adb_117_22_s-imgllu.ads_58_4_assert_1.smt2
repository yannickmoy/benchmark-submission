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
(declare-fun bool_eq (Int
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

(declare-datatypes ((big_natural__ref 0))
  (((big_natural__refqtmk (big_natural__content Int)))))

;; big_natural__ref_big_natural__content__projection
(define-fun big_natural__ref_big_natural__content__projection ((a big_natural__ref)) Int
  (big_natural__content a))

(declare-const x Int)

(declare-datatypes ((big_positive__ref 0))
  (((big_positive__refqtmk (big_positive__content Int)))))

;; big_positive__ref_big_positive__content__projection
(define-fun big_positive__ref_big_positive__content__projection ((a big_positive__ref)) Int
  (big_positive__content a))

(declare-const y Int)

(declare-const z Int)

(declare-const xy Int)

(declare-const yz Int)

(declare-const xyz Int)

(declare-const r Int)

;; dynamic_invariant
(define-fun dynamic_invariant ((temp___expr_723 Int) (temp___is_init_719 Bool) (temp___skip_constant_720 Bool) (temp___do_toplevel_721 Bool) (temp___do_typ_inv_722 Bool)) Bool
  (=>
    (= temp___do_toplevel_721 true)
    (=> (= temp___is_init_719 true) (<= 0 temp___expr_723))))

;; dynamic_invariant
(define-fun dynamic_invariant1 ((temp___expr_731 Int) (temp___is_init_727 Bool) (temp___skip_constant_728 Bool) (temp___do_toplevel_729 Bool) (temp___do_typ_inv_730 Bool)) Bool
  (=>
    (= temp___do_toplevel_729 true)
    (=> (= temp___is_init_727 true) (< 0 temp___expr_731))))

;; dynamic_invariant
(define-fun dynamic_invariant2 ((temp___expr_256 Int) (temp___is_init_252 Bool) (temp___skip_constant_253 Bool) (temp___do_toplevel_254 Bool) (temp___do_typ_inv_255 Bool)) Bool
  true)

;; xy__def_axiom
(assert (= xy (div1 x y)))

;; yz__def_axiom
(assert (= yz (* y z)))

;; xyz__def_axiom
(assert (= xyz (div1 (div1 x y) z)))

;; r__def_axiom
(assert (= r (+ (* (mod1 xy z) y) (mod1 x y))))

;; Assume
(assert (dynamic_invariant x true false true true))

;; Assume
(assert (dynamic_invariant1 y true false true true))

;; Assume
(assert (dynamic_invariant1 z true false true true))

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert (<= 0 (div1 x y)))

;; Assume
(assert (= (div1 x y) xy))

;; Assume
(assert (dynamic_invariant xy true false true true))

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert (<= 0 (* y z)))

;; Assume
(assert (= (* y z) yz))

;; Assume
(assert (dynamic_invariant yz true false true true))

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert (<= 0 (div1 (div1 x y) z)))

;; Assume
(assert (= (div1 (div1 x y) z) xyz))

;; Assume
(assert (dynamic_invariant xyz true false true true))

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert true)

;; Assert
(assert (<= 0 (+ (* (mod1 xy z) y) (mod1 x y))))

;; Assume
(assert (= (+ (* (mod1 xy z) y) (mod1 x y)) r))

;; Assume
(assert (dynamic_invariant r true false true true))

;; Assert
(assert (= x (+ (* xy y) (mod1 x y))))

;; Assert
(assert (= xy (+ (* (div1 xy z) z) (mod1 xy z))))

;; Assert
(assert (= x (+ (* xyz yz) r)))

;; Assert
(assert (<= (* (mod1 xy z) y) (* (- z 1) y)))

;; Assert
(assert (<= r (- yz 1)))

;; Assert
(assert (= (div1 x yz) (div1 (+ (* xyz yz) r) yz)))

;; Goal def'vc
;; File "s-imageu.adb", line 84, characters 0-0
(assert
  (not (= (div1 x yz) (+ xyz (div1 r yz)))))

(check-sat)
(exit)
