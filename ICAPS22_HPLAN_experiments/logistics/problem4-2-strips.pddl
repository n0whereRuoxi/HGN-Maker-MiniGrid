( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-542 - location
    l000-792 - location
    l000-372 - location
    l000-242 - location
    l000-585 - location
    l000-142 - location
    p370 - obj
    p282 - obj
    p84 - obj
    p16 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-542 c000 )
    ( in-city l000-792 c000 )
    ( in-city l000-372 c000 )
    ( in-city l000-242 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-142 c000 )
    ( obj-at p370 l000-372 )
    ( obj-at p282 l000-792 )
    ( obj-at p84 l000-142 )
    ( obj-at p16 l000-542 )
  )
  ( :goal
    ( and
      ( obj-at p370 l000-000 )
      ( obj-at p282 l000-000 )
      ( obj-at p84 l000-000 )
      ( obj-at p16 l000-000 )
    )
  )
)
