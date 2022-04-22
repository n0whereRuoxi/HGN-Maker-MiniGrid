( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-978 - location
    l000-107 - location
    l000-828 - location
    l000-922 - location
    l000-648 - location
    l000-106 - location
    p597 - obj
    p537 - obj
    p476 - obj
    p488 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-978 c000 )
    ( in-city l000-107 c000 )
    ( in-city l000-828 c000 )
    ( in-city l000-922 c000 )
    ( in-city l000-648 c000 )
    ( in-city l000-106 c000 )
    ( obj-at p597 l000-828 )
    ( obj-at p537 l000-978 )
    ( obj-at p476 l000-828 )
    ( obj-at p488 l000-107 )
  )
  ( :goal
    ( and
      ( obj-at p597 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p476 l000-000 )
      ( obj-at p488 l000-000 )
    )
  )
)
