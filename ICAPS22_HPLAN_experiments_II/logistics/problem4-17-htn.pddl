( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-613 - location
    l000-248 - location
    l000-624 - location
    l000-165 - location
    p445 - obj
    p978 - obj
    p277 - obj
    p397 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-613 c000 )
    ( in-city l000-248 c000 )
    ( in-city l000-624 c000 )
    ( in-city l000-165 c000 )
    ( obj-at p445 l000-165 )
    ( obj-at p978 l000-248 )
    ( obj-at p277 l000-248 )
    ( obj-at p397 l000-624 )
  )
  ( :tasks
    ( Deliver-4Pkg p445 p978 p277 p397 l000-000 )
  )
)
