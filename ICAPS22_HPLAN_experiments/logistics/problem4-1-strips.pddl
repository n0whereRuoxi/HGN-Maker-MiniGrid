( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-487 - location
    l000-605 - location
    l000-563 - location
    p614 - obj
    p621 - obj
    p904 - obj
    p271 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-487 c000 )
    ( in-city l000-605 c000 )
    ( in-city l000-563 c000 )
    ( obj-at p614 l000-563 )
    ( obj-at p621 l000-563 )
    ( obj-at p904 l000-487 )
    ( obj-at p271 l000-605 )
  )
  ( :goal
    ( and
      ( obj-at p614 l000-000 )
      ( obj-at p621 l000-000 )
      ( obj-at p904 l000-000 )
      ( obj-at p271 l000-000 )
    )
  )
)
