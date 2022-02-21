( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-151 - location
    l000-939 - location
    l000-527 - location
    l000-884 - location
    p852 - obj
    p99 - obj
    p377 - obj
    p39 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-151 c000 )
    ( in-city l000-939 c000 )
    ( in-city l000-527 c000 )
    ( in-city l000-884 c000 )
    ( obj-at p852 l000-151 )
    ( obj-at p99 l000-151 )
    ( obj-at p377 l000-884 )
    ( obj-at p39 l000-884 )
  )
  ( :goal
    ( and
      ( obj-at p852 l000-000 )
      ( obj-at p99 l000-000 )
      ( obj-at p377 l000-000 )
      ( obj-at p39 l000-000 )
    )
  )
)
