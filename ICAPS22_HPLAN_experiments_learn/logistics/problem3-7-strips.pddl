( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-197 - location
    l000-795 - location
    l000-991 - location
    p541 - obj
    p48 - obj
    p441 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-197 c000 )
    ( in-city l000-795 c000 )
    ( in-city l000-991 c000 )
    ( obj-at p541 l000-991 )
    ( obj-at p48 l000-991 )
    ( obj-at p441 l000-197 )
  )
  ( :goal
    ( and
      ( obj-at p541 l000-000 )
      ( obj-at p48 l000-000 )
      ( obj-at p441 l000-000 )
    )
  )
)
