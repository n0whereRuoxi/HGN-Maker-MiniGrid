( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-44 - location
    p617 - obj
    p751 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-44 c000 )
    ( obj-at p617 l000-44 )
    ( obj-at p751 l000-44 )
  )
  ( :goal
    ( and
      ( obj-at p617 l000-000 )
      ( obj-at p751 l000-000 )
    )
  )
)
