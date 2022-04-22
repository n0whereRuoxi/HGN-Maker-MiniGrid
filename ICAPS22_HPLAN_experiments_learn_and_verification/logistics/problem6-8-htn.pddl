( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-415 - location
    l000-717 - location
    l000-253 - location
    l000-327 - location
    l000-856 - location
    l000-324 - location
    l000-300 - location
    p792 - obj
    p616 - obj
    p919 - obj
    p542 - obj
    p21 - obj
    p213 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-415 c000 )
    ( in-city l000-717 c000 )
    ( in-city l000-253 c000 )
    ( in-city l000-327 c000 )
    ( in-city l000-856 c000 )
    ( in-city l000-324 c000 )
    ( in-city l000-300 c000 )
    ( obj-at p792 l000-415 )
    ( obj-at p616 l000-324 )
    ( obj-at p919 l000-327 )
    ( obj-at p542 l000-327 )
    ( obj-at p21 l000-253 )
    ( obj-at p213 l000-253 )
  )
  ( :tasks
    ( Deliver-6Pkg p792 p616 p919 p542 p21 p213 l000-000 )
  )
)
