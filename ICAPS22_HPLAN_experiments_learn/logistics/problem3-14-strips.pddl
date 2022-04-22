( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-924 - location
    l000-471 - location
    l000-683 - location
    l000-974 - location
    p345 - obj
    p485 - obj
    p857 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-924 c000 )
    ( in-city l000-471 c000 )
    ( in-city l000-683 c000 )
    ( in-city l000-974 c000 )
    ( obj-at p345 l000-471 )
    ( obj-at p485 l000-974 )
    ( obj-at p857 l000-683 )
  )
  ( :goal
    ( and
      ( obj-at p345 l000-000 )
      ( obj-at p485 l000-000 )
      ( obj-at p857 l000-000 )
    )
  )
)
