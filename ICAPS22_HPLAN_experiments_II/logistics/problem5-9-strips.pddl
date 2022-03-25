( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-282 - location
    l000-508 - location
    l000-967 - location
    l000-484 - location
    l000-150 - location
    l000-875 - location
    l000-762 - location
    l000-69 - location
    l000-555 - location
    l000-177 - location
    p639 - obj
    p451 - obj
    p861 - obj
    p27 - obj
    p638 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-282 c000 )
    ( in-city l000-508 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-484 c000 )
    ( in-city l000-150 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-762 c000 )
    ( in-city l000-69 c000 )
    ( in-city l000-555 c000 )
    ( in-city l000-177 c000 )
    ( obj-at p639 l000-508 )
    ( obj-at p451 l000-508 )
    ( obj-at p861 l000-508 )
    ( obj-at p27 l000-282 )
    ( obj-at p638 l000-762 )
  )
  ( :goal
    ( and
      ( obj-at p639 l000-000 )
      ( obj-at p451 l000-000 )
      ( obj-at p861 l000-000 )
      ( obj-at p27 l000-000 )
      ( obj-at p638 l000-000 )
    )
  )
)
