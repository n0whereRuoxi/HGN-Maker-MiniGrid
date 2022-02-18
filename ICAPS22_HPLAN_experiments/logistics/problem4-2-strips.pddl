( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-995 - location
    l000-342 - location
    l000-659 - location
    p937 - obj
    p37 - obj
    p137 - obj
    p572 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-995 c000 )
    ( in-city l000-342 c000 )
    ( in-city l000-659 c000 )
    ( obj-at p937 l000-659 )
    ( obj-at p37 l000-659 )
    ( obj-at p137 l000-659 )
    ( obj-at p572 l000-995 )
  )
  ( :goal
    ( and
      ( obj-at p937 l000-000 )
      ( obj-at p37 l000-000 )
      ( obj-at p137 l000-000 )
      ( obj-at p572 l000-000 )
    )
  )
)
