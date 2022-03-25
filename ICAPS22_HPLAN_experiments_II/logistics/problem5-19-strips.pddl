( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-462 - location
    l000-669 - location
    l000-684 - location
    l000-207 - location
    l000-376 - location
    l000-444 - location
    p67 - obj
    p27 - obj
    p166 - obj
    p85 - obj
    p865 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-462 c000 )
    ( in-city l000-669 c000 )
    ( in-city l000-684 c000 )
    ( in-city l000-207 c000 )
    ( in-city l000-376 c000 )
    ( in-city l000-444 c000 )
    ( obj-at p67 l000-462 )
    ( obj-at p27 l000-462 )
    ( obj-at p166 l000-444 )
    ( obj-at p85 l000-376 )
    ( obj-at p865 l000-444 )
  )
  ( :goal
    ( and
      ( obj-at p67 l000-000 )
      ( obj-at p27 l000-000 )
      ( obj-at p166 l000-000 )
      ( obj-at p85 l000-000 )
      ( obj-at p865 l000-000 )
    )
  )
)
