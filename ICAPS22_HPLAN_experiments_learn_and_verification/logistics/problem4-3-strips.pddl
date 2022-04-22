( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-635 - location
    l000-667 - location
    l000-406 - location
    l000-933 - location
    p845 - obj
    p38 - obj
    p974 - obj
    p42 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-635 c000 )
    ( in-city l000-667 c000 )
    ( in-city l000-406 c000 )
    ( in-city l000-933 c000 )
    ( obj-at p845 l000-933 )
    ( obj-at p38 l000-667 )
    ( obj-at p974 l000-933 )
    ( obj-at p42 l000-667 )
  )
  ( :goal
    ( and
      ( obj-at p845 l000-000 )
      ( obj-at p38 l000-000 )
      ( obj-at p974 l000-000 )
      ( obj-at p42 l000-000 )
    )
  )
)
