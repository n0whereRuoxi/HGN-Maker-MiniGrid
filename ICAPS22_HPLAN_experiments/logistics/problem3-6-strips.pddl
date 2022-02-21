( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-973 - location
    l000-810 - location
    p895 - obj
    p48 - obj
    p887 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-973 c000 )
    ( in-city l000-810 c000 )
    ( obj-at p895 l000-810 )
    ( obj-at p48 l000-810 )
    ( obj-at p887 l000-973 )
  )
  ( :goal
    ( and
      ( obj-at p895 l000-000 )
      ( obj-at p48 l000-000 )
      ( obj-at p887 l000-000 )
    )
  )
)
