( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-547 - location
    l000-763 - location
    l000-747 - location
    p9 - obj
    p209 - obj
    p338 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-547 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-747 c000 )
    ( obj-at p9 l000-747 )
    ( obj-at p209 l000-547 )
    ( obj-at p338 l000-547 )
  )
  ( :goal
    ( and
      ( obj-at p9 l000-000 )
      ( obj-at p209 l000-000 )
      ( obj-at p338 l000-000 )
    )
  )
)
