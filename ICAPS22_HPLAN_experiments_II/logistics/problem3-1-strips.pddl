( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-12 - location
    l000-628 - location
    l000-531 - location
    p756 - obj
    p701 - obj
    p773 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-12 c000 )
    ( in-city l000-628 c000 )
    ( in-city l000-531 c000 )
    ( obj-at p756 l000-531 )
    ( obj-at p701 l000-531 )
    ( obj-at p773 l000-531 )
  )
  ( :goal
    ( and
      ( obj-at p756 l000-000 )
      ( obj-at p701 l000-000 )
      ( obj-at p773 l000-000 )
    )
  )
)
