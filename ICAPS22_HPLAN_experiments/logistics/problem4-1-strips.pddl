( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-921 - location
    l000-532 - location
    p257 - obj
    p665 - obj
    p519 - obj
    p316 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-921 c000 )
    ( in-city l000-532 c000 )
    ( obj-at p257 l000-532 )
    ( obj-at p665 l000-921 )
    ( obj-at p519 l000-921 )
    ( obj-at p316 l000-532 )
  )
  ( :goal
    ( and
      ( obj-at p257 l000-000 )
      ( obj-at p665 l000-000 )
      ( obj-at p519 l000-000 )
      ( obj-at p316 l000-000 )
    )
  )
)
