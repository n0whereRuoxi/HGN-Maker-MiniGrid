( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-630 - location
    l000-173 - location
    l000-848 - location
    l000-671 - location
    l000-52 - location
    p470 - obj
    p960 - obj
    p46 - obj
    p301 - obj
    p771 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-630 c000 )
    ( in-city l000-173 c000 )
    ( in-city l000-848 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-52 c000 )
    ( obj-at p470 l000-173 )
    ( obj-at p960 l000-848 )
    ( obj-at p46 l000-671 )
    ( obj-at p301 l000-848 )
    ( obj-at p771 l000-52 )
  )
  ( :goal
    ( and
      ( obj-at p470 l000-000 )
      ( obj-at p960 l000-000 )
      ( obj-at p46 l000-000 )
      ( obj-at p301 l000-000 )
      ( obj-at p771 l000-000 )
    )
  )
)
