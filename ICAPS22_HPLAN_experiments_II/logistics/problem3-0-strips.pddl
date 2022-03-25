( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-763 - location
    l000-87 - location
    l000-245 - location
    l000-699 - location
    l000-718 - location
    l000-716 - location
    p804 - obj
    p753 - obj
    p707 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-763 c000 )
    ( in-city l000-87 c000 )
    ( in-city l000-245 c000 )
    ( in-city l000-699 c000 )
    ( in-city l000-718 c000 )
    ( in-city l000-716 c000 )
    ( obj-at p804 l000-245 )
    ( obj-at p753 l000-699 )
    ( obj-at p707 l000-245 )
  )
  ( :goal
    ( and
      ( obj-at p804 l000-000 )
      ( obj-at p753 l000-000 )
      ( obj-at p707 l000-000 )
    )
  )
)
