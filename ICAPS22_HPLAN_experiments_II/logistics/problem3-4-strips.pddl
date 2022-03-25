( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-740 - location
    l000-588 - location
    p487 - obj
    p385 - obj
    p110 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-740 c000 )
    ( in-city l000-588 c000 )
    ( obj-at p487 l000-588 )
    ( obj-at p385 l000-588 )
    ( obj-at p110 l000-740 )
  )
  ( :goal
    ( and
      ( obj-at p487 l000-000 )
      ( obj-at p385 l000-000 )
      ( obj-at p110 l000-000 )
    )
  )
)
