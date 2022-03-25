( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-633 - location
    l000-767 - location
    l000-642 - location
    l000-557 - location
    p67 - obj
    p459 - obj
    p574 - obj
    p486 - obj
    p324 - obj
    p38 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-633 c000 )
    ( in-city l000-767 c000 )
    ( in-city l000-642 c000 )
    ( in-city l000-557 c000 )
    ( obj-at p67 l000-642 )
    ( obj-at p459 l000-642 )
    ( obj-at p574 l000-633 )
    ( obj-at p486 l000-642 )
    ( obj-at p324 l000-767 )
    ( obj-at p38 l000-767 )
  )
  ( :goal
    ( and
      ( obj-at p67 l000-000 )
      ( obj-at p459 l000-000 )
      ( obj-at p574 l000-000 )
      ( obj-at p486 l000-000 )
      ( obj-at p324 l000-000 )
      ( obj-at p38 l000-000 )
    )
  )
)
