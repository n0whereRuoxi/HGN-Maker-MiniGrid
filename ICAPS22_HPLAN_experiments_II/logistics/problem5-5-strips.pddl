( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-608 - location
    l000-979 - location
    l000-621 - location
    l000-980 - location
    l000-763 - location
    p674 - obj
    p582 - obj
    p989 - obj
    p784 - obj
    p785 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-608 c000 )
    ( in-city l000-979 c000 )
    ( in-city l000-621 c000 )
    ( in-city l000-980 c000 )
    ( in-city l000-763 c000 )
    ( obj-at p674 l000-979 )
    ( obj-at p582 l000-608 )
    ( obj-at p989 l000-608 )
    ( obj-at p784 l000-763 )
    ( obj-at p785 l000-979 )
  )
  ( :goal
    ( and
      ( obj-at p674 l000-000 )
      ( obj-at p582 l000-000 )
      ( obj-at p989 l000-000 )
      ( obj-at p784 l000-000 )
      ( obj-at p785 l000-000 )
    )
  )
)
