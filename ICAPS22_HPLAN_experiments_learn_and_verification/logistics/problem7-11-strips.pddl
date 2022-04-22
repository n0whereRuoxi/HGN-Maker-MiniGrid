( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-490 - location
    l000-317 - location
    l000-653 - location
    l000-463 - location
    l000-678 - location
    l000-935 - location
    l000-106 - location
    l000-573 - location
    l000-861 - location
    p57 - obj
    p523 - obj
    p161 - obj
    p170 - obj
    p359 - obj
    p64 - obj
    p180 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-490 c000 )
    ( in-city l000-317 c000 )
    ( in-city l000-653 c000 )
    ( in-city l000-463 c000 )
    ( in-city l000-678 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-106 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-861 c000 )
    ( obj-at p57 l000-106 )
    ( obj-at p523 l000-106 )
    ( obj-at p161 l000-678 )
    ( obj-at p170 l000-935 )
    ( obj-at p359 l000-935 )
    ( obj-at p64 l000-573 )
    ( obj-at p180 l000-106 )
  )
  ( :goal
    ( and
      ( obj-at p57 l000-000 )
      ( obj-at p523 l000-000 )
      ( obj-at p161 l000-000 )
      ( obj-at p170 l000-000 )
      ( obj-at p359 l000-000 )
      ( obj-at p64 l000-000 )
      ( obj-at p180 l000-000 )
    )
  )
)
