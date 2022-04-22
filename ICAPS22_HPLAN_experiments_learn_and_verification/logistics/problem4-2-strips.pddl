( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-707 - location
    l000-669 - location
    l000-20 - location
    l000-631 - location
    l000-780 - location
    l000-674 - location
    p556 - obj
    p587 - obj
    p93 - obj
    p972 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-707 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-20 c000 )
    ( in-city l000-631 c000 )
    ( in-city l000-780 c000 )
    ( in-city l000-674 c000 )
    ( obj-at p556 l000-707 )
    ( obj-at p587 l000-674 )
    ( obj-at p93 l000-631 )
    ( obj-at p972 l000-669 )
  )
  ( :goal
    ( and
      ( obj-at p556 l000-000 )
      ( obj-at p587 l000-000 )
      ( obj-at p93 l000-000 )
      ( obj-at p972 l000-000 )
    )
  )
)
