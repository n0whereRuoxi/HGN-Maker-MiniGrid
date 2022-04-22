( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-13 - location
    l000-979 - location
    l000-98 - location
    p175 - obj
    p624 - obj
    p51 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-13 c000 )
    ( in-city l000-979 c000 )
    ( in-city l000-98 c000 )
    ( obj-at p175 l000-13 )
    ( obj-at p624 l000-979 )
    ( obj-at p51 l000-979 )
  )
  ( :goal
    ( and
      ( obj-at p175 l000-000 )
      ( obj-at p624 l000-000 )
      ( obj-at p51 l000-000 )
    )
  )
)
