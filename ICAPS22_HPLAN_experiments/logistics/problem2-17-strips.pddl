( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-881 - location
    p465 - obj
    p904 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-881 c000 )
    ( obj-at p465 l000-881 )
    ( obj-at p904 l000-881 )
  )
  ( :goal
    ( and
      ( obj-at p465 l000-000 )
      ( obj-at p904 l000-000 )
    )
  )
)
