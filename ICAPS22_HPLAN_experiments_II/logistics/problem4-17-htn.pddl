( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-25 - location
    l000-23 - location
    l000-790 - location
    l000-101 - location
    l000-603 - location
    p332 - obj
    p943 - obj
    p910 - obj
    p558 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-25 c000 )
    ( in-city l000-23 c000 )
    ( in-city l000-790 c000 )
    ( in-city l000-101 c000 )
    ( in-city l000-603 c000 )
    ( obj-at p332 l000-101 )
    ( obj-at p943 l000-23 )
    ( obj-at p910 l000-101 )
    ( obj-at p558 l000-23 )
  )
  ( :tasks
    ( Deliver-4Pkg p332 p943 p910 p558 l000-000 )
  )
)
