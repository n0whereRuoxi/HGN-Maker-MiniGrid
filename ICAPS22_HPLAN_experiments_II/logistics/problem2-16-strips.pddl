( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-578 - location
    p295 - obj
    p492 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-578 c000 )
    ( obj-at p295 l000-578 )
    ( obj-at p492 l000-578 )
  )
  ( :goal
    ( and
      ( obj-at p295 l000-000 )
      ( obj-at p492 l000-000 )
    )
  )
)
