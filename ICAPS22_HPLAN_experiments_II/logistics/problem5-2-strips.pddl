( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-118 - location
    l000-210 - location
    l000-566 - location
    l000-164 - location
    l000-438 - location
    p750 - obj
    p518 - obj
    p868 - obj
    p777 - obj
    p548 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-118 c000 )
    ( in-city l000-210 c000 )
    ( in-city l000-566 c000 )
    ( in-city l000-164 c000 )
    ( in-city l000-438 c000 )
    ( obj-at p750 l000-164 )
    ( obj-at p518 l000-566 )
    ( obj-at p868 l000-566 )
    ( obj-at p777 l000-438 )
    ( obj-at p548 l000-438 )
  )
  ( :goal
    ( and
      ( obj-at p750 l000-000 )
      ( obj-at p518 l000-000 )
      ( obj-at p868 l000-000 )
      ( obj-at p777 l000-000 )
      ( obj-at p548 l000-000 )
    )
  )
)
