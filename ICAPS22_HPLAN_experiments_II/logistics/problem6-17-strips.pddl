( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-632 - location
    l000-317 - location
    l000-424 - location
    l000-318 - location
    p51 - obj
    p119 - obj
    p419 - obj
    p792 - obj
    p685 - obj
    p630 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-632 c000 )
    ( in-city l000-317 c000 )
    ( in-city l000-424 c000 )
    ( in-city l000-318 c000 )
    ( obj-at p51 l000-317 )
    ( obj-at p119 l000-424 )
    ( obj-at p419 l000-318 )
    ( obj-at p792 l000-318 )
    ( obj-at p685 l000-632 )
    ( obj-at p630 l000-632 )
  )
  ( :goal
    ( and
      ( obj-at p51 l000-000 )
      ( obj-at p119 l000-000 )
      ( obj-at p419 l000-000 )
      ( obj-at p792 l000-000 )
      ( obj-at p685 l000-000 )
      ( obj-at p630 l000-000 )
    )
  )
)
