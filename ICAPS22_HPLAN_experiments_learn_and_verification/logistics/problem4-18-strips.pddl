( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-288 - location
    l000-302 - location
    p61 - obj
    p881 - obj
    p582 - obj
    p257 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-288 c000 )
    ( in-city l000-302 c000 )
    ( obj-at p61 l000-302 )
    ( obj-at p881 l000-302 )
    ( obj-at p582 l000-288 )
    ( obj-at p257 l000-288 )
  )
  ( :goal
    ( and
      ( obj-at p61 l000-000 )
      ( obj-at p881 l000-000 )
      ( obj-at p582 l000-000 )
      ( obj-at p257 l000-000 )
    )
  )
)
