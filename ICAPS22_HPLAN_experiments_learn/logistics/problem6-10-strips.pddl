( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-753 - location
    l000-761 - location
    l000-526 - location
    l000-818 - location
    l000-676 - location
    l000-339 - location
    p217 - obj
    p207 - obj
    p545 - obj
    p673 - obj
    p173 - obj
    p371 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-753 c000 )
    ( in-city l000-761 c000 )
    ( in-city l000-526 c000 )
    ( in-city l000-818 c000 )
    ( in-city l000-676 c000 )
    ( in-city l000-339 c000 )
    ( obj-at p217 l000-753 )
    ( obj-at p207 l000-676 )
    ( obj-at p545 l000-818 )
    ( obj-at p673 l000-676 )
    ( obj-at p173 l000-526 )
    ( obj-at p371 l000-339 )
  )
  ( :goal
    ( and
      ( obj-at p217 l000-000 )
      ( obj-at p207 l000-000 )
      ( obj-at p545 l000-000 )
      ( obj-at p673 l000-000 )
      ( obj-at p173 l000-000 )
      ( obj-at p371 l000-000 )
    )
  )
)
