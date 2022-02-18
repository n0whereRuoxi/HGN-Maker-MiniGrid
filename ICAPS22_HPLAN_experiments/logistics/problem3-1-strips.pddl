( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-668 - location
    l000-574 - location
    l000-151 - location
    l000-982 - location
    l000-264 - location
    l000-645 - location
    p846 - obj
    p550 - obj
    p214 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-668 c000 )
    ( in-city l000-574 c000 )
    ( in-city l000-151 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-264 c000 )
    ( in-city l000-645 c000 )
    ( obj-at p846 l000-574 )
    ( obj-at p550 l000-264 )
    ( obj-at p214 l000-668 )
  )
  ( :goal
    ( and
      ( obj-at p846 l000-000 )
      ( obj-at p550 l000-000 )
      ( obj-at p214 l000-000 )
    )
  )
)
