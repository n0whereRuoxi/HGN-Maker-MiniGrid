( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-677 - location
    l000-597 - location
    l000-946 - location
    l000-847 - location
    l000-95 - location
    p373 - obj
    p220 - obj
    p946 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-677 c000 )
    ( in-city l000-597 c000 )
    ( in-city l000-946 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-95 c000 )
    ( obj-at p373 l000-946 )
    ( obj-at p220 l000-677 )
    ( obj-at p946 l000-95 )
  )
  ( :goal
    ( and
      ( obj-at p373 l000-000 )
      ( obj-at p220 l000-000 )
      ( obj-at p946 l000-000 )
    )
  )
)
