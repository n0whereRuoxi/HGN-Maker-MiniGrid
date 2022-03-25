( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-635 - location
    l000-589 - location
    l000-406 - location
    l000-376 - location
    p556 - obj
    p393 - obj
    p320 - obj
    p501 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-635 c000 )
    ( in-city l000-589 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-376 c000 )
    ( obj-at p556 l000-635 )
    ( obj-at p393 l000-376 )
    ( obj-at p320 l000-589 )
    ( obj-at p501 l000-376 )
  )
  ( :goal
    ( and
      ( obj-at p556 l000-000 )
      ( obj-at p393 l000-000 )
      ( obj-at p320 l000-000 )
      ( obj-at p501 l000-000 )
    )
  )
)
