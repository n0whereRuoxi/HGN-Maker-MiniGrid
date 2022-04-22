( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-853 - location
    l000-534 - location
    l000-192 - location
    l000-47 - location
    l000-852 - location
    p835 - obj
    p309 - obj
    p63 - obj
    p448 - obj
    p543 - obj
    p141 - obj
    p207 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-853 c000 )
    ( in-city l000-534 c000 )
    ( in-city l000-192 c000 )
    ( in-city l000-47 c000 )
    ( in-city l000-852 c000 )
    ( obj-at p835 l000-192 )
    ( obj-at p309 l000-534 )
    ( obj-at p63 l000-534 )
    ( obj-at p448 l000-534 )
    ( obj-at p543 l000-534 )
    ( obj-at p141 l000-47 )
    ( obj-at p207 l000-192 )
  )
  ( :goal
    ( and
      ( obj-at p835 l000-000 )
      ( obj-at p309 l000-000 )
      ( obj-at p63 l000-000 )
      ( obj-at p448 l000-000 )
      ( obj-at p543 l000-000 )
      ( obj-at p141 l000-000 )
      ( obj-at p207 l000-000 )
    )
  )
)
