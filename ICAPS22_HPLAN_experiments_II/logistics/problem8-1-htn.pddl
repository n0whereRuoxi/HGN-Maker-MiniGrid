( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-588 - location
    l000-573 - location
    l000-902 - location
    l000-645 - location
    l000-843 - location
    p70 - obj
    p845 - obj
    p102 - obj
    p360 - obj
    p676 - obj
    p303 - obj
    p548 - obj
    p38 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-588 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-902 c000 )
    ( in-city l000-645 c000 )
    ( in-city l000-843 c000 )
    ( obj-at p70 l000-902 )
    ( obj-at p845 l000-843 )
    ( obj-at p102 l000-843 )
    ( obj-at p360 l000-645 )
    ( obj-at p676 l000-645 )
    ( obj-at p303 l000-902 )
    ( obj-at p548 l000-588 )
    ( obj-at p38 l000-645 )
  )
  ( :tasks
    ( Deliver-8Pkg p70 p845 p102 p360 p676 p303 p548 p38 l000-000 )
  )
)
