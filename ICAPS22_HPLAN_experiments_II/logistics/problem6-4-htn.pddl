( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-559 - location
    l000-283 - location
    l000-450 - location
    l000-116 - location
    p139 - obj
    p31 - obj
    p927 - obj
    p532 - obj
    p820 - obj
    p649 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-559 c000 )
    ( in-city l000-283 c000 )
    ( in-city l000-450 c000 )
    ( in-city l000-116 c000 )
    ( obj-at p139 l000-559 )
    ( obj-at p31 l000-116 )
    ( obj-at p927 l000-283 )
    ( obj-at p532 l000-283 )
    ( obj-at p820 l000-450 )
    ( obj-at p649 l000-450 )
  )
  ( :tasks
    ( Deliver-6Pkg p139 p31 p927 p532 p820 p649 l000-000 )
  )
)
