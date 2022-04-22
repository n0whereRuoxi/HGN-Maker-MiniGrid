( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-572 - location
    l000-732 - location
    l000-772 - location
    p300 - obj
    p526 - obj
    p424 - obj
    p897 - obj
    p958 - obj
    p126 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-572 c000 )
    ( in-city l000-732 c000 )
    ( in-city l000-772 c000 )
    ( obj-at p300 l000-772 )
    ( obj-at p526 l000-732 )
    ( obj-at p424 l000-732 )
    ( obj-at p897 l000-772 )
    ( obj-at p958 l000-572 )
    ( obj-at p126 l000-732 )
  )
  ( :goal
    ( and
      ( obj-at p300 l000-000 )
      ( obj-at p526 l000-000 )
      ( obj-at p424 l000-000 )
      ( obj-at p897 l000-000 )
      ( obj-at p958 l000-000 )
      ( obj-at p126 l000-000 )
    )
  )
)
