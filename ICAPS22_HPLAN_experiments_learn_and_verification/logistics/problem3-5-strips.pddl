( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-187 - location
    l000-581 - location
    l000-940 - location
    p356 - obj
    p54 - obj
    p326 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-187 c000 )
    ( in-city l000-581 c000 )
    ( in-city l000-940 c000 )
    ( obj-at p356 l000-187 )
    ( obj-at p54 l000-581 )
    ( obj-at p326 l000-187 )
  )
  ( :goal
    ( and
      ( obj-at p356 l000-000 )
      ( obj-at p54 l000-000 )
      ( obj-at p326 l000-000 )
    )
  )
)
