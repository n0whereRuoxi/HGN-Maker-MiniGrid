( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-848 - location
    l000-517 - location
    l000-986 - location
    l000-645 - location
    p57 - obj
    p41 - obj
    p331 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-848 c000 )
    ( in-city l000-517 c000 )
    ( in-city l000-986 c000 )
    ( in-city l000-645 c000 )
    ( obj-at p57 l000-517 )
    ( obj-at p41 l000-986 )
    ( obj-at p331 l000-848 )
  )
  ( :goal
    ( and
      ( obj-at p57 l000-000 )
      ( obj-at p41 l000-000 )
      ( obj-at p331 l000-000 )
    )
  )
)
