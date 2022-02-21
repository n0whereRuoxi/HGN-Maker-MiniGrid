( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-408 - location
    l000-3 - location
    p638 - obj
    p960 - obj
    p113 - obj
    p849 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-408 c000 )
    ( in-city l000-3 c000 )
    ( obj-at p638 l000-3 )
    ( obj-at p960 l000-408 )
    ( obj-at p113 l000-408 )
    ( obj-at p849 l000-408 )
  )
  ( :goal
    ( and
      ( obj-at p638 l000-000 )
      ( obj-at p960 l000-000 )
      ( obj-at p113 l000-000 )
      ( obj-at p849 l000-000 )
    )
  )
)
