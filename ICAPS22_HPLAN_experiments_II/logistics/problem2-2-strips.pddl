( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-344 - location
    l000-643 - location
    l000-515 - location
    l000-575 - location
    p911 - obj
    p593 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-344 c000 )
    ( in-city l000-643 c000 )
    ( in-city l000-515 c000 )
    ( in-city l000-575 c000 )
    ( obj-at p911 l000-575 )
    ( obj-at p593 l000-344 )
  )
  ( :goal
    ( and
      ( obj-at p911 l000-000 )
      ( obj-at p593 l000-000 )
    )
  )
)
