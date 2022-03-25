( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-779 - location
    l000-727 - location
    l000-772 - location
    l000-176 - location
    p702 - obj
    p26 - obj
    p2 - obj
    p7 - obj
    p355 - obj
    p281 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-779 c000 )
    ( in-city l000-727 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-176 c000 )
    ( obj-at p702 l000-772 )
    ( obj-at p26 l000-772 )
    ( obj-at p2 l000-176 )
    ( obj-at p7 l000-727 )
    ( obj-at p355 l000-772 )
    ( obj-at p281 l000-779 )
  )
  ( :tasks
    ( Deliver-6Pkg p702 p26 p2 p7 p355 p281 l000-000 )
  )
)
