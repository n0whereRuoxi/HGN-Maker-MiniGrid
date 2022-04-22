( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-986 - location
    l000-867 - location
    p560 - obj
    p621 - obj
    p80 - obj
    p237 - obj
    p35 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-986 c000 )
    ( in-city l000-867 c000 )
    ( obj-at p560 l000-986 )
    ( obj-at p621 l000-867 )
    ( obj-at p80 l000-986 )
    ( obj-at p237 l000-867 )
    ( obj-at p35 l000-986 )
  )
  ( :goal
    ( and
      ( obj-at p560 l000-000 )
      ( obj-at p621 l000-000 )
      ( obj-at p80 l000-000 )
      ( obj-at p237 l000-000 )
      ( obj-at p35 l000-000 )
    )
  )
)
