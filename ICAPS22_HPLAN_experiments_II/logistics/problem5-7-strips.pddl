( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-432 - location
    l000-546 - location
    l000-696 - location
    l000-650 - location
    p952 - obj
    p261 - obj
    p713 - obj
    p419 - obj
    p292 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-432 c000 )
    ( in-city l000-546 c000 )
    ( in-city l000-696 c000 )
    ( in-city l000-650 c000 )
    ( obj-at p952 l000-432 )
    ( obj-at p261 l000-432 )
    ( obj-at p713 l000-650 )
    ( obj-at p419 l000-696 )
    ( obj-at p292 l000-696 )
  )
  ( :goal
    ( and
      ( obj-at p952 l000-000 )
      ( obj-at p261 l000-000 )
      ( obj-at p713 l000-000 )
      ( obj-at p419 l000-000 )
      ( obj-at p292 l000-000 )
    )
  )
)
