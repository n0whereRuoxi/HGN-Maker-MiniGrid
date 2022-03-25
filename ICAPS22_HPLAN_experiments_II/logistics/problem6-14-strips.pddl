( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-188 - location
    l000-139 - location
    l000-268 - location
    l000-409 - location
    l000-633 - location
    p753 - obj
    p159 - obj
    p940 - obj
    p491 - obj
    p956 - obj
    p677 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-188 c000 )
    ( in-city l000-139 c000 )
    ( in-city l000-268 c000 )
    ( in-city l000-409 c000 )
    ( in-city l000-633 c000 )
    ( obj-at p753 l000-139 )
    ( obj-at p159 l000-139 )
    ( obj-at p940 l000-139 )
    ( obj-at p491 l000-633 )
    ( obj-at p956 l000-188 )
    ( obj-at p677 l000-633 )
  )
  ( :goal
    ( and
      ( obj-at p753 l000-000 )
      ( obj-at p159 l000-000 )
      ( obj-at p940 l000-000 )
      ( obj-at p491 l000-000 )
      ( obj-at p956 l000-000 )
      ( obj-at p677 l000-000 )
    )
  )
)
