( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-524 - location
    l000-266 - location
    l000-910 - location
    l000-739 - location
    p24 - obj
    p682 - obj
    p879 - obj
    p957 - obj
    p190 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-524 c000 )
    ( in-city l000-266 c000 )
    ( in-city l000-910 c000 )
    ( in-city l000-739 c000 )
    ( obj-at p24 l000-739 )
    ( obj-at p682 l000-266 )
    ( obj-at p879 l000-910 )
    ( obj-at p957 l000-266 )
    ( obj-at p190 l000-266 )
  )
  ( :goal
    ( and
      ( obj-at p24 l000-000 )
      ( obj-at p682 l000-000 )
      ( obj-at p879 l000-000 )
      ( obj-at p957 l000-000 )
      ( obj-at p190 l000-000 )
    )
  )
)
