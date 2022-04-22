( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-107 - location
    l000-50 - location
    l000-167 - location
    l000-674 - location
    l000-675 - location
    l000-24 - location
    l000-473 - location
    p644 - obj
    p874 - obj
    p986 - obj
    p823 - obj
    p363 - obj
    p698 - obj
    p537 - obj
    p699 - obj
    p578 - obj
    p432 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-107 c000 )
    ( in-city l000-50 c000 )
    ( in-city l000-167 c000 )
    ( in-city l000-674 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-24 c000 )
    ( in-city l000-473 c000 )
    ( obj-at p644 l000-675 )
    ( obj-at p874 l000-473 )
    ( obj-at p986 l000-167 )
    ( obj-at p823 l000-167 )
    ( obj-at p363 l000-674 )
    ( obj-at p698 l000-24 )
    ( obj-at p537 l000-473 )
    ( obj-at p699 l000-24 )
    ( obj-at p578 l000-167 )
    ( obj-at p432 l000-107 )
  )
  ( :goal
    ( and
      ( obj-at p644 l000-000 )
      ( obj-at p874 l000-000 )
      ( obj-at p986 l000-000 )
      ( obj-at p823 l000-000 )
      ( obj-at p363 l000-000 )
      ( obj-at p698 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p699 l000-000 )
      ( obj-at p578 l000-000 )
      ( obj-at p432 l000-000 )
    )
  )
)
