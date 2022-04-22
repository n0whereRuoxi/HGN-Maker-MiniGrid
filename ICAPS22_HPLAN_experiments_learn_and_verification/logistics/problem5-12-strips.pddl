( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-977 - location
    l000-697 - location
    l000-633 - location
    l000-493 - location
    p935 - obj
    p838 - obj
    p927 - obj
    p617 - obj
    p904 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-977 c000 )
    ( in-city l000-697 c000 )
    ( in-city l000-633 c000 )
    ( in-city l000-493 c000 )
    ( obj-at p935 l000-633 )
    ( obj-at p838 l000-977 )
    ( obj-at p927 l000-697 )
    ( obj-at p617 l000-977 )
    ( obj-at p904 l000-493 )
  )
  ( :goal
    ( and
      ( obj-at p935 l000-000 )
      ( obj-at p838 l000-000 )
      ( obj-at p927 l000-000 )
      ( obj-at p617 l000-000 )
      ( obj-at p904 l000-000 )
    )
  )
)
