( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-800 - location
    l000-29 - location
    p142 - obj
    p419 - obj
    p982 - obj
    p171 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-800 c000 )
    ( in-city l000-29 c000 )
    ( obj-at p142 l000-29 )
    ( obj-at p419 l000-29 )
    ( obj-at p982 l000-800 )
    ( obj-at p171 l000-800 )
  )
  ( :goal
    ( and
      ( obj-at p142 l000-000 )
      ( obj-at p419 l000-000 )
      ( obj-at p982 l000-000 )
      ( obj-at p171 l000-000 )
    )
  )
)
