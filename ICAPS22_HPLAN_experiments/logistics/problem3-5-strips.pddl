( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-882 - location
    l000-893 - location
    l000-446 - location
    l000-702 - location
    p89 - obj
    p133 - obj
    p17 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-882 c000 )
    ( in-city l000-893 c000 )
    ( in-city l000-446 c000 )
    ( in-city l000-702 c000 )
    ( obj-at p89 l000-446 )
    ( obj-at p133 l000-446 )
    ( obj-at p17 l000-882 )
  )
  ( :goal
    ( and
      ( obj-at p89 l000-000 )
      ( obj-at p133 l000-000 )
      ( obj-at p17 l000-000 )
    )
  )
)
