( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-149 - location
    l000-707 - location
    l000-854 - location
    p707 - obj
    p149 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-149 c000 )
    ( in-city l000-707 c000 )
    ( in-city l000-854 c000 )
    ( obj-at p707 l000-707 )
    ( obj-at p149 l000-149 )
  )
  ( :goal
    ( and
      ( obj-at p707 l000-000 )
      ( obj-at p149 l000-000 )
    )
  )
)
