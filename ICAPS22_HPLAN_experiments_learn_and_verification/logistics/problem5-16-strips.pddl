( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-378 - location
    l000-77 - location
    l000-762 - location
    l000-924 - location
    l000-313 - location
    l000-376 - location
    l000-484 - location
    l000-382 - location
    l000-553 - location
    p502 - obj
    p720 - obj
    p239 - obj
    p325 - obj
    p331 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-378 c000 )
    ( in-city l000-77 c000 )
    ( in-city l000-762 c000 )
    ( in-city l000-924 c000 )
    ( in-city l000-313 c000 )
    ( in-city l000-376 c000 )
    ( in-city l000-484 c000 )
    ( in-city l000-382 c000 )
    ( in-city l000-553 c000 )
    ( obj-at p502 l000-378 )
    ( obj-at p720 l000-376 )
    ( obj-at p239 l000-484 )
    ( obj-at p325 l000-762 )
    ( obj-at p331 l000-77 )
  )
  ( :goal
    ( and
      ( obj-at p502 l000-000 )
      ( obj-at p720 l000-000 )
      ( obj-at p239 l000-000 )
      ( obj-at p325 l000-000 )
      ( obj-at p331 l000-000 )
    )
  )
)
