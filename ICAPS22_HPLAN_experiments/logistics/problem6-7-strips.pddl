( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-431 - location
    l000-36 - location
    l000-392 - location
    l000-373 - location
    l000-108 - location
    l000-368 - location
    l000-737 - location
    l000-765 - location
    l000-959 - location
    l000-886 - location
    p802 - obj
    p244 - obj
    p111 - obj
    p429 - obj
    p199 - obj
    p962 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-431 c000 )
    ( in-city l000-36 c000 )
    ( in-city l000-392 c000 )
    ( in-city l000-373 c000 )
    ( in-city l000-108 c000 )
    ( in-city l000-368 c000 )
    ( in-city l000-737 c000 )
    ( in-city l000-765 c000 )
    ( in-city l000-959 c000 )
    ( in-city l000-886 c000 )
    ( obj-at p802 l000-765 )
    ( obj-at p244 l000-368 )
    ( obj-at p111 l000-36 )
    ( obj-at p429 l000-373 )
    ( obj-at p199 l000-959 )
    ( obj-at p962 l000-959 )
  )
  ( :goal
    ( and
      ( obj-at p802 l000-000 )
      ( obj-at p244 l000-000 )
      ( obj-at p111 l000-000 )
      ( obj-at p429 l000-000 )
      ( obj-at p199 l000-000 )
      ( obj-at p962 l000-000 )
    )
  )
)
