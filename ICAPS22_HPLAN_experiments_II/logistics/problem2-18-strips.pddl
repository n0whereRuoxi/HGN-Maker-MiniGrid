( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-572 - location
    l000-688 - location
    p22 - obj
    p268 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-572 c000 )
    ( in-city l000-688 c000 )
    ( obj-at p22 l000-572 )
    ( obj-at p268 l000-572 )
  )
  ( :goal
    ( and
      ( obj-at p22 l000-000 )
      ( obj-at p268 l000-000 )
    )
  )
)
