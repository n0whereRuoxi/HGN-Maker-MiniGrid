( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-997 - location
    l000-280 - location
    l000-541 - location
    l000-570 - location
    l000-567 - location
    l000-772 - location
    l000-427 - location
    p291 - obj
    p694 - obj
    p745 - obj
    p770 - obj
    p977 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-997 c000 )
    ( in-city l000-280 c000 )
    ( in-city l000-541 c000 )
    ( in-city l000-570 c000 )
    ( in-city l000-567 c000 )
    ( in-city l000-772 c000 )
    ( in-city l000-427 c000 )
    ( obj-at p291 l000-541 )
    ( obj-at p694 l000-541 )
    ( obj-at p745 l000-280 )
    ( obj-at p770 l000-772 )
    ( obj-at p977 l000-570 )
  )
  ( :goal
    ( and
      ( obj-at p291 l000-000 )
      ( obj-at p694 l000-000 )
      ( obj-at p745 l000-000 )
      ( obj-at p770 l000-000 )
      ( obj-at p977 l000-000 )
    )
  )
)
