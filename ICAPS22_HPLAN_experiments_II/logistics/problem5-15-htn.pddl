( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-349 - location
    l000-311 - location
    p577 - obj
    p761 - obj
    p548 - obj
    p869 - obj
    p391 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-349 c000 )
    ( in-city l000-311 c000 )
    ( obj-at p577 l000-349 )
    ( obj-at p761 l000-349 )
    ( obj-at p548 l000-311 )
    ( obj-at p869 l000-311 )
    ( obj-at p391 l000-311 )
  )
  ( :tasks
    ( Deliver-5Pkg p577 p761 p548 p869 p391 l000-000 )
  )
)
