( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-727 - location
    l000-500 - location
    l000-128 - location
    l000-824 - location
    l000-688 - location
    l000-205 - location
    l000-502 - location
    l000-953 - location
    l000-672 - location
    l000-416 - location
    l000-31 - location
    p273 - obj
    p89 - obj
    p792 - obj
    p972 - obj
    p116 - obj
    p607 - obj
    p148 - obj
    p294 - obj
    p285 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-727 c000 )
    ( in-city l000-500 c000 )
    ( in-city l000-128 c000 )
    ( in-city l000-824 c000 )
    ( in-city l000-688 c000 )
    ( in-city l000-205 c000 )
    ( in-city l000-502 c000 )
    ( in-city l000-953 c000 )
    ( in-city l000-672 c000 )
    ( in-city l000-416 c000 )
    ( in-city l000-31 c000 )
    ( obj-at p273 l000-502 )
    ( obj-at p89 l000-672 )
    ( obj-at p792 l000-953 )
    ( obj-at p972 l000-727 )
    ( obj-at p116 l000-727 )
    ( obj-at p607 l000-688 )
    ( obj-at p148 l000-953 )
    ( obj-at p294 l000-502 )
    ( obj-at p285 l000-727 )
  )
  ( :goal
    ( and
      ( obj-at p273 l000-000 )
      ( obj-at p89 l000-000 )
      ( obj-at p792 l000-000 )
      ( obj-at p972 l000-000 )
      ( obj-at p116 l000-000 )
      ( obj-at p607 l000-000 )
      ( obj-at p148 l000-000 )
      ( obj-at p294 l000-000 )
      ( obj-at p285 l000-000 )
    )
  )
)
