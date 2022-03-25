( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-928 - location
    l000-796 - location
    l000-854 - location
    p423 - obj
    p900 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-928 c000 )
    ( in-city l000-796 c000 )
    ( in-city l000-854 c000 )
    ( obj-at p423 l000-796 )
    ( obj-at p900 l000-928 )
  )
  ( :tasks
    ( Deliver-2Pkg p423 p900 l000-000 )
  )
)
