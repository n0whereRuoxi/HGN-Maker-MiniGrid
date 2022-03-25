( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-647 - location
    l000-177 - location
    l000-394 - location
    l000-449 - location
    l000-431 - location
    l000-379 - location
    p232 - obj
    p882 - obj
    p503 - obj
    p64 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-647 c000 )
    ( in-city l000-177 c000 )
    ( in-city l000-394 c000 )
    ( in-city l000-449 c000 )
    ( in-city l000-431 c000 )
    ( in-city l000-379 c000 )
    ( obj-at p232 l000-177 )
    ( obj-at p882 l000-449 )
    ( obj-at p503 l000-647 )
    ( obj-at p64 l000-449 )
  )
  ( :goal
    ( and
      ( obj-at p232 l000-000 )
      ( obj-at p882 l000-000 )
      ( obj-at p503 l000-000 )
      ( obj-at p64 l000-000 )
    )
  )
)
