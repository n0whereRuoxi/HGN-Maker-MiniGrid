( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-70 - location
    l000-410 - location
    l000-483 - location
    l000-647 - location
    l000-807 - location
    p936 - obj
    p171 - obj
    p401 - obj
    p973 - obj
    p904 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-70 c000 )
    ( in-city l000-410 c000 )
    ( in-city l000-483 c000 )
    ( in-city l000-647 c000 )
    ( in-city l000-807 c000 )
    ( obj-at p936 l000-483 )
    ( obj-at p171 l000-483 )
    ( obj-at p401 l000-647 )
    ( obj-at p973 l000-70 )
    ( obj-at p904 l000-410 )
  )
  ( :goal
    ( and
      ( obj-at p936 l000-000 )
      ( obj-at p171 l000-000 )
      ( obj-at p401 l000-000 )
      ( obj-at p973 l000-000 )
      ( obj-at p904 l000-000 )
    )
  )
)
