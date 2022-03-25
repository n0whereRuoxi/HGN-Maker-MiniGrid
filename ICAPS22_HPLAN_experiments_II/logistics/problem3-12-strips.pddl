( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-566 - location
    l000-633 - location
    l000-100 - location
    l000-755 - location
    p846 - obj
    p517 - obj
    p184 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-566 c000 )
    ( in-city l000-633 c000 )
    ( in-city l000-100 c000 )
    ( in-city l000-755 c000 )
    ( obj-at p846 l000-100 )
    ( obj-at p517 l000-755 )
    ( obj-at p184 l000-566 )
  )
  ( :goal
    ( and
      ( obj-at p846 l000-000 )
      ( obj-at p517 l000-000 )
      ( obj-at p184 l000-000 )
    )
  )
)
