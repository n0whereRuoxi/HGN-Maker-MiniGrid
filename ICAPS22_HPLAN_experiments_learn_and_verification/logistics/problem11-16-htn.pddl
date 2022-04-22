( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-484 - location
    l000-558 - location
    l000-460 - location
    l000-162 - location
    l000-888 - location
    l000-749 - location
    l000-787 - location
    l000-925 - location
    l000-325 - location
    l000-323 - location
    l000-959 - location
    l000-119 - location
    l000-486 - location
    l000-948 - location
    l000-29 - location
    l000-178 - location
    p707 - obj
    p459 - obj
    p271 - obj
    p116 - obj
    p148 - obj
    p95 - obj
    p230 - obj
    p256 - obj
    p356 - obj
    p244 - obj
    p103 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-484 c000 )
    ( in-city l000-558 c000 )
    ( in-city l000-460 c000 )
    ( in-city l000-162 c000 )
    ( in-city l000-888 c000 )
    ( in-city l000-749 c000 )
    ( in-city l000-787 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-325 c000 )
    ( in-city l000-323 c000 )
    ( in-city l000-959 c000 )
    ( in-city l000-119 c000 )
    ( in-city l000-486 c000 )
    ( in-city l000-948 c000 )
    ( in-city l000-29 c000 )
    ( in-city l000-178 c000 )
    ( obj-at p707 l000-162 )
    ( obj-at p459 l000-162 )
    ( obj-at p271 l000-484 )
    ( obj-at p116 l000-323 )
    ( obj-at p148 l000-460 )
    ( obj-at p95 l000-888 )
    ( obj-at p230 l000-486 )
    ( obj-at p256 l000-29 )
    ( obj-at p356 l000-323 )
    ( obj-at p244 l000-486 )
    ( obj-at p103 l000-119 )
  )
  ( :tasks
    ( Deliver-11Pkg p707 p459 p271 p116 p148 p95 p230 p256 p356 p244 p103 l000-000 )
  )
)
