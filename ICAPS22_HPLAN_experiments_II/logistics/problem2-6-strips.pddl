( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-541 - location
    l000-223 - location
    p638 - obj
    p333 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-541 c000 )
    ( in-city l000-223 c000 )
    ( obj-at p638 l000-223 )
    ( obj-at p333 l000-223 )
  )
  ( :goal
    ( and
      ( obj-at p638 l000-000 )
      ( obj-at p333 l000-000 )
    )
  )
)
