( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-926 - location
    l000-398 - location
    p890 - obj
    p294 - obj
    p397 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-926 c000 )
    ( in-city l000-398 c000 )
    ( obj-at p890 l000-398 )
    ( obj-at p294 l000-926 )
    ( obj-at p397 l000-926 )
  )
  ( :goal
    ( and
      ( obj-at p890 l000-000 )
      ( obj-at p294 l000-000 )
      ( obj-at p397 l000-000 )
    )
  )
)
