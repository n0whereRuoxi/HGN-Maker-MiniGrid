( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-607 - location
    l000-644 - location
    l000-356 - location
    l000-310 - location
    l000-694 - location
    p795 - obj
    p802 - obj
    p594 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-607 c000 )
    ( in-city l000-644 c000 )
    ( in-city l000-356 c000 )
    ( in-city l000-310 c000 )
    ( in-city l000-694 c000 )
    ( obj-at p795 l000-607 )
    ( obj-at p802 l000-644 )
    ( obj-at p594 l000-644 )
  )
  ( :goal
    ( and
      ( obj-at p795 l000-000 )
      ( obj-at p802 l000-000 )
      ( obj-at p594 l000-000 )
    )
  )
)
