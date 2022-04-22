( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-959 - location
    l000-347 - location
    l000-339 - location
    l000-343 - location
    l000-116 - location
    p343 - obj
    p596 - obj
    p912 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-959 c000 )
    ( in-city l000-347 c000 )
    ( in-city l000-339 c000 )
    ( in-city l000-343 c000 )
    ( in-city l000-116 c000 )
    ( obj-at p343 l000-959 )
    ( obj-at p596 l000-343 )
    ( obj-at p912 l000-116 )
  )
  ( :goal
    ( and
      ( obj-at p343 l000-000 )
      ( obj-at p596 l000-000 )
      ( obj-at p912 l000-000 )
    )
  )
)
