( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-696 - location
    l000-26 - location
    l000-773 - location
    l000-288 - location
    l000-56 - location
    p926 - obj
    p219 - obj
    p881 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-696 c000 )
    ( in-city l000-26 c000 )
    ( in-city l000-773 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-56 c000 )
    ( obj-at p926 l000-288 )
    ( obj-at p219 l000-56 )
    ( obj-at p881 l000-56 )
  )
  ( :goal
    ( and
      ( obj-at p926 l000-000 )
      ( obj-at p219 l000-000 )
      ( obj-at p881 l000-000 )
    )
  )
)
