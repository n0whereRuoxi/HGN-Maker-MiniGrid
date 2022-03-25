( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-879 - location
    l000-95 - location
    l000-686 - location
    l000-761 - location
    l000-637 - location
    l000-739 - location
    p29 - obj
    p222 - obj
    p696 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-879 c000 )
    ( in-city l000-95 c000 )
    ( in-city l000-686 c000 )
    ( in-city l000-761 c000 )
    ( in-city l000-637 c000 )
    ( in-city l000-739 c000 )
    ( obj-at p29 l000-95 )
    ( obj-at p222 l000-637 )
    ( obj-at p696 l000-739 )
  )
  ( :goal
    ( and
      ( obj-at p29 l000-000 )
      ( obj-at p222 l000-000 )
      ( obj-at p696 l000-000 )
    )
  )
)
