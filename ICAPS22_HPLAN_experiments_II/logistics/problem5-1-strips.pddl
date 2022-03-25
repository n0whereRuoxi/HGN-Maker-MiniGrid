( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-847 - location
    l000-583 - location
    l000-418 - location
    l000-6 - location
    p706 - obj
    p613 - obj
    p996 - obj
    p1 - obj
    p597 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-847 c000 )
    ( in-city l000-583 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-6 c000 )
    ( obj-at p706 l000-847 )
    ( obj-at p613 l000-583 )
    ( obj-at p996 l000-6 )
    ( obj-at p1 l000-418 )
    ( obj-at p597 l000-583 )
  )
  ( :goal
    ( and
      ( obj-at p706 l000-000 )
      ( obj-at p613 l000-000 )
      ( obj-at p996 l000-000 )
      ( obj-at p1 l000-000 )
      ( obj-at p597 l000-000 )
    )
  )
)
