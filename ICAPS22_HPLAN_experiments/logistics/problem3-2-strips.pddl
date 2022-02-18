( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-430 - location
    l000-35 - location
    l000-993 - location
    l000-576 - location
    l000-282 - location
    l000-486 - location
    p282 - obj
    p993 - obj
    p486 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-430 c000 )
    ( in-city l000-35 c000 )
    ( in-city l000-993 c000 )
    ( in-city l000-576 c000 )
    ( in-city l000-282 c000 )
    ( in-city l000-486 c000 )
    ( obj-at p282 l000-282 )
    ( obj-at p993 l000-993 )
    ( obj-at p486 l000-486 )
  )
  ( :goal
    ( and
      ( obj-at p282 l000-000 )
      ( obj-at p993 l000-000 )
      ( obj-at p486 l000-000 )
    )
  )
)
