( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-247 - location
    l000-583 - location
    l000-473 - location
    p140 - obj
    p606 - obj
    p62 - obj
    p97 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-247 c000 )
    ( in-city l000-583 c000 )
    ( in-city l000-473 c000 )
    ( obj-at p140 l000-583 )
    ( obj-at p606 l000-583 )
    ( obj-at p62 l000-247 )
    ( obj-at p97 l000-583 )
  )
  ( :goal
    ( and
      ( obj-at p140 l000-000 )
      ( obj-at p606 l000-000 )
      ( obj-at p62 l000-000 )
      ( obj-at p97 l000-000 )
    )
  )
)
