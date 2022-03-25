( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-131 - location
    l000-192 - location
    l000-127 - location
    l000-910 - location
    l000-820 - location
    l000-904 - location
    l000-482 - location
    l000-622 - location
    p672 - obj
    p978 - obj
    p607 - obj
    p253 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-131 c000 )
    ( in-city l000-192 c000 )
    ( in-city l000-127 c000 )
    ( in-city l000-910 c000 )
    ( in-city l000-820 c000 )
    ( in-city l000-904 c000 )
    ( in-city l000-482 c000 )
    ( in-city l000-622 c000 )
    ( obj-at p672 l000-127 )
    ( obj-at p978 l000-127 )
    ( obj-at p607 l000-910 )
    ( obj-at p253 l000-131 )
  )
  ( :goal
    ( and
      ( obj-at p672 l000-000 )
      ( obj-at p978 l000-000 )
      ( obj-at p607 l000-000 )
      ( obj-at p253 l000-000 )
    )
  )
)
