(set-info :smt-lib-version 2.6)
(set-logic QF_IDL)
(set-info :source | These instances are encoded from job shop scheduling problemencoded from job shop schedul-ing problem resembling 'https://clc-gitlab.cs.uiowa.edu:2443/SMT-LIB-benchmarks/QF_IDL/-/blob/master/job_shop/'. 
 Note that there exists a mistake in the encoding method of original instances, and we fix it in new instances. 
 This problem was added to SMT-LIB by Bohan Li.|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "crafted")
(set-info :status sat)
(declare-fun s1_1 () Int)
(declare-fun s1_2 () Int)
(declare-fun s2_1 () Int)
(declare-fun s2_2 () Int)
(declare-fun m1_1 () Int)
(declare-fun m1_2 () Int)
(declare-fun m2_1 () Int)
(declare-fun m2_2 () Int)
(declare-fun ref () Int)
(assert (and
(<= (- m1_1 ref) 0)
(>= (- m1_1 ref) 0)
(<= (- m1_2 ref) 0)
(>= (- m1_2 ref) 0)
(<= (- m2_1 ref) 0)
(>= (- m2_1 ref) 0)
(<= (- m2_2 ref) 0)
(>= (- m2_2 ref) 0)

(>= (- s1_1 ref) 0)
(>= (- s2_1 ref) 0)

(<= (- s1_2 ref) 12)
(<= (- s2_2 ref) 12)

(>= (- s1_2 s1_1) 4)
(>= (- s2_2 s2_1) 4)

(or (not (= (- m1_1 m2_1) 0)) (>= (- s1_1 s2_1) 4) (>= (- s2_1 s1_1) 4)) 
(or (not (= (- m1_1 m2_2) 0)) (>= (- s1_1 s2_2) 4) (>= (- s2_2 s1_1) 4)) 
(or (not (= (- m1_2 m2_1) 0)) (>= (- s1_2 s2_1) 4) (>= (- s2_1 s1_2) 4)) 
(or (not (= (- m1_2 m2_2) 0)) (>= (- s1_2 s2_2) 4) (>= (- s2_2 s1_2) 4)) 
))
(check-sat)
(exit)
