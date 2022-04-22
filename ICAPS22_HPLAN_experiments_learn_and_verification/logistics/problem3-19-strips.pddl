( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-251 - location
    l000-68 - location
    l000-739 - location
    l000-819 - location
    p622 - obj
    p160 - obj
    p676 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-251 c000 )
    ( in-city l000-68 c000 )
    ( in-city l000-739 c000 )
    ( in-city l000-819 c000 )
    ( obj-at p622 l000-251 )
    ( obj-at p160 l000-819 )
    ( obj-at p676 l000-819 )
  )
  ( :goal
    ( and
      ( obj-at p622 l000-000 )
      ( obj-at p160 l000-000 )
      ( obj-at p676 l000-000 )
    )
  )
)
