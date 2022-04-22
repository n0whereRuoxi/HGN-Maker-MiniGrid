( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-945 - location
    l000-680 - location
    l000-923 - location
    l000-77 - location
    l000-955 - location
    p28 - obj
    p887 - obj
    p380 - obj
    p706 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-945 c000 )
    ( in-city l000-680 c000 )
    ( in-city l000-923 c000 )
    ( in-city l000-77 c000 )
    ( in-city l000-955 c000 )
    ( obj-at p28 l000-680 )
    ( obj-at p887 l000-923 )
    ( obj-at p380 l000-923 )
    ( obj-at p706 l000-955 )
  )
  ( :goal
    ( and
      ( obj-at p28 l000-000 )
      ( obj-at p887 l000-000 )
      ( obj-at p380 l000-000 )
      ( obj-at p706 l000-000 )
    )
  )
)
