( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-681 - location
    l000-766 - location
    l000-701 - location
    l000-992 - location
    l000-728 - location
    l000-172 - location
    l000-628 - location
    p401 - obj
    p228 - obj
    p806 - obj
    p597 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-681 c000 )
    ( in-city l000-766 c000 )
    ( in-city l000-701 c000 )
    ( in-city l000-992 c000 )
    ( in-city l000-728 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-628 c000 )
    ( obj-at p401 l000-992 )
    ( obj-at p228 l000-628 )
    ( obj-at p806 l000-766 )
    ( obj-at p597 l000-728 )
  )
  ( :goal
    ( and
      ( obj-at p401 l000-000 )
      ( obj-at p228 l000-000 )
      ( obj-at p806 l000-000 )
      ( obj-at p597 l000-000 )
    )
  )
)
