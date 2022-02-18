( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-818 - location
    p917 - obj
    p881 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-818 c000 )
    ( obj-at p917 l000-818 )
    ( obj-at p881 l000-818 )
  )
  ( :goal
    ( and
      ( obj-at p917 l000-000 )
      ( obj-at p881 l000-000 )
    )
  )
)
