( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-862 - location
    l000-865 - location
    l000-424 - location
    l000-962 - location
    p693 - obj
    p249 - obj
    p788 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-862 c000 )
    ( in-city l000-865 c000 )
    ( in-city l000-424 c000 )
    ( in-city l000-962 c000 )
    ( obj-at p693 l000-862 )
    ( obj-at p249 l000-862 )
    ( obj-at p788 l000-865 )
  )
  ( :goal
    ( and
      ( obj-at p693 l000-000 )
      ( obj-at p249 l000-000 )
      ( obj-at p788 l000-000 )
    )
  )
)
