( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-433 - location
    l000-610 - location
    l000-917 - location
    l000-441 - location
    l000-276 - location
    l000-643 - location
    p717 - obj
    p784 - obj
    p642 - obj
    p427 - obj
    p815 - obj
    p260 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-433 c000 )
    ( in-city l000-610 c000 )
    ( in-city l000-917 c000 )
    ( in-city l000-441 c000 )
    ( in-city l000-276 c000 )
    ( in-city l000-643 c000 )
    ( obj-at p717 l000-610 )
    ( obj-at p784 l000-917 )
    ( obj-at p642 l000-441 )
    ( obj-at p427 l000-610 )
    ( obj-at p815 l000-276 )
    ( obj-at p260 l000-441 )
  )
  ( :goal
    ( and
      ( obj-at p717 l000-000 )
      ( obj-at p784 l000-000 )
      ( obj-at p642 l000-000 )
      ( obj-at p427 l000-000 )
      ( obj-at p815 l000-000 )
      ( obj-at p260 l000-000 )
    )
  )
)
