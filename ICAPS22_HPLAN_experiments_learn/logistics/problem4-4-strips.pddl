( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-418 - location
    l000-308 - location
    l000-979 - location
    l000-106 - location
    l000-481 - location
    l000-716 - location
    l000-250 - location
    l000-209 - location
    p216 - obj
    p902 - obj
    p80 - obj
    p980 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-418 c000 )
    ( in-city l000-308 c000 )
    ( in-city l000-979 c000 )
    ( in-city l000-106 c000 )
    ( in-city l000-481 c000 )
    ( in-city l000-716 c000 )
    ( in-city l000-250 c000 )
    ( in-city l000-209 c000 )
    ( obj-at p216 l000-209 )
    ( obj-at p902 l000-979 )
    ( obj-at p80 l000-250 )
    ( obj-at p980 l000-481 )
  )
  ( :goal
    ( and
      ( obj-at p216 l000-000 )
      ( obj-at p902 l000-000 )
      ( obj-at p80 l000-000 )
      ( obj-at p980 l000-000 )
    )
  )
)
