( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-553 - location
    l000-782 - location
    l000-167 - location
    p43 - obj
    p818 - obj
    p89 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-553 c000 )
    ( in-city l000-782 c000 )
    ( in-city l000-167 c000 )
    ( obj-at p43 l000-782 )
    ( obj-at p818 l000-553 )
    ( obj-at p89 l000-167 )
  )
  ( :goal
    ( and
      ( obj-at p43 l000-000 )
      ( obj-at p818 l000-000 )
      ( obj-at p89 l000-000 )
    )
  )
)
