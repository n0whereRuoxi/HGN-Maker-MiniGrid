( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-457 - location
    l000-495 - location
    l000-214 - location
    l000-161 - location
    l000-602 - location
    l000-66 - location
    p722 - obj
    p405 - obj
    p973 - obj
    p134 - obj
    p873 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-457 c000 )
    ( in-city l000-495 c000 )
    ( in-city l000-214 c000 )
    ( in-city l000-161 c000 )
    ( in-city l000-602 c000 )
    ( in-city l000-66 c000 )
    ( obj-at p722 l000-457 )
    ( obj-at p405 l000-66 )
    ( obj-at p973 l000-66 )
    ( obj-at p134 l000-214 )
    ( obj-at p873 l000-457 )
  )
  ( :goal
    ( and
      ( obj-at p722 l000-000 )
      ( obj-at p405 l000-000 )
      ( obj-at p973 l000-000 )
      ( obj-at p134 l000-000 )
      ( obj-at p873 l000-000 )
    )
  )
)
