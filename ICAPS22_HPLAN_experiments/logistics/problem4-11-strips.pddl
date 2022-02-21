( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-699 - location
    l000-577 - location
    p725 - obj
    p492 - obj
    p956 - obj
    p72 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-699 c000 )
    ( in-city l000-577 c000 )
    ( obj-at p725 l000-577 )
    ( obj-at p492 l000-699 )
    ( obj-at p956 l000-577 )
    ( obj-at p72 l000-699 )
  )
  ( :goal
    ( and
      ( obj-at p725 l000-000 )
      ( obj-at p492 l000-000 )
      ( obj-at p956 l000-000 )
      ( obj-at p72 l000-000 )
    )
  )
)
