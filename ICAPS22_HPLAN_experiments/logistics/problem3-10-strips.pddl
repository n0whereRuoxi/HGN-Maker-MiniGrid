( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-114 - location
    l000-675 - location
    l000-345 - location
    p520 - obj
    p584 - obj
    p675 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-114 c000 )
    ( in-city l000-675 c000 )
    ( in-city l000-345 c000 )
    ( obj-at p520 l000-675 )
    ( obj-at p584 l000-675 )
    ( obj-at p675 l000-675 )
  )
  ( :goal
    ( and
      ( obj-at p520 l000-000 )
      ( obj-at p584 l000-000 )
      ( obj-at p675 l000-000 )
    )
  )
)
