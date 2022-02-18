( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-6 - location
    l000-969 - location
    p313 - obj
    p88 - obj
    p412 - obj
    p810 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-6 c000 )
    ( in-city l000-969 c000 )
    ( obj-at p313 l000-969 )
    ( obj-at p88 l000-969 )
    ( obj-at p412 l000-6 )
    ( obj-at p810 l000-6 )
  )
  ( :goal
    ( and
      ( obj-at p313 l000-000 )
      ( obj-at p88 l000-000 )
      ( obj-at p412 l000-000 )
      ( obj-at p810 l000-000 )
    )
  )
)
