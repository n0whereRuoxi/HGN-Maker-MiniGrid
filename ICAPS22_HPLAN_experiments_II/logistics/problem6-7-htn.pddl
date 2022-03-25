( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-575 - location
    l000-808 - location
    l000-636 - location
    l000-838 - location
    l000-438 - location
    l000-615 - location
    l000-245 - location
    l000-950 - location
    l000-486 - location
    p362 - obj
    p690 - obj
    p260 - obj
    p574 - obj
    p411 - obj
    p419 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-575 c000 )
    ( in-city l000-808 c000 )
    ( in-city l000-636 c000 )
    ( in-city l000-838 c000 )
    ( in-city l000-438 c000 )
    ( in-city l000-615 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-950 c000 )
    ( in-city l000-486 c000 )
    ( obj-at p362 l000-950 )
    ( obj-at p690 l000-636 )
    ( obj-at p260 l000-245 )
    ( obj-at p574 l000-575 )
    ( obj-at p411 l000-636 )
    ( obj-at p419 l000-615 )
  )
  ( :tasks
    ( Deliver-6Pkg p362 p690 p260 p574 p411 p419 l000-000 )
  )
)
