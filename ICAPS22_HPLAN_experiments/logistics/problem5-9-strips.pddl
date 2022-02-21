( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-432 - location
    l000-873 - location
    l000-740 - location
    l000-850 - location
    p327 - obj
    p379 - obj
    p741 - obj
    p459 - obj
    p384 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-432 c000 )
    ( in-city l000-873 c000 )
    ( in-city l000-740 c000 )
    ( in-city l000-850 c000 )
    ( obj-at p327 l000-740 )
    ( obj-at p379 l000-850 )
    ( obj-at p741 l000-850 )
    ( obj-at p459 l000-850 )
    ( obj-at p384 l000-740 )
  )
  ( :goal
    ( and
      ( obj-at p327 l000-000 )
      ( obj-at p379 l000-000 )
      ( obj-at p741 l000-000 )
      ( obj-at p459 l000-000 )
      ( obj-at p384 l000-000 )
    )
  )
)
