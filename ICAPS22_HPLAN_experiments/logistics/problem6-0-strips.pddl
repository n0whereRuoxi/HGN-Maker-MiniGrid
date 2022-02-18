( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-52 - location
    l000-17 - location
    l000-545 - location
    l000-248 - location
    p80 - obj
    p115 - obj
    p916 - obj
    p141 - obj
    p752 - obj
    p701 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-52 c000 )
    ( in-city l000-17 c000 )
    ( in-city l000-545 c000 )
    ( in-city l000-248 c000 )
    ( obj-at p80 l000-545 )
    ( obj-at p115 l000-17 )
    ( obj-at p916 l000-248 )
    ( obj-at p141 l000-545 )
    ( obj-at p752 l000-545 )
    ( obj-at p701 l000-17 )
  )
  ( :goal
    ( and
      ( obj-at p80 l000-000 )
      ( obj-at p115 l000-000 )
      ( obj-at p916 l000-000 )
      ( obj-at p141 l000-000 )
      ( obj-at p752 l000-000 )
      ( obj-at p701 l000-000 )
    )
  )
)
