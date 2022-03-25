( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-865 - location
    l000-265 - location
    l000-910 - location
    p538 - obj
    p129 - obj
    p732 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-865 c000 )
    ( in-city l000-265 c000 )
    ( in-city l000-910 c000 )
    ( obj-at p538 l000-910 )
    ( obj-at p129 l000-910 )
    ( obj-at p732 l000-910 )
  )
  ( :tasks
    ( Deliver-3Pkg p538 p129 p732 l000-000 )
  )
)
