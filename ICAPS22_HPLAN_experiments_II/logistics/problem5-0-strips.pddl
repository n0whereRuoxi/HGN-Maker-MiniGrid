( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-701 - location
    l000-705 - location
    l000-231 - location
    p519 - obj
    p203 - obj
    p634 - obj
    p193 - obj
    p452 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-701 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-231 c000 )
    ( obj-at p519 l000-231 )
    ( obj-at p203 l000-705 )
    ( obj-at p634 l000-701 )
    ( obj-at p193 l000-701 )
    ( obj-at p452 l000-701 )
  )
  ( :goal
    ( and
      ( obj-at p519 l000-000 )
      ( obj-at p203 l000-000 )
      ( obj-at p634 l000-000 )
      ( obj-at p193 l000-000 )
      ( obj-at p452 l000-000 )
    )
  )
)
