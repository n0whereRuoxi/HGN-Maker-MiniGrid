( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-816 - location
    l000-512 - location
    l000-561 - location
    p142 - obj
    p57 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-816 c000 )
    ( in-city l000-512 c000 )
    ( in-city l000-561 c000 )
    ( obj-at p142 l000-561 )
    ( obj-at p57 l000-512 )
  )
  ( :goal
    ( and
      ( obj-at p142 l000-000 )
      ( obj-at p57 l000-000 )
    )
  )
)
