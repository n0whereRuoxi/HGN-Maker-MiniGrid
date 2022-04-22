( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-685 - location
    l000-718 - location
    l000-745 - location
    l000-490 - location
    l000-406 - location
    p750 - obj
    p383 - obj
    p723 - obj
    p348 - obj
    p361 - obj
    p952 - obj
    p708 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-685 c000 )
    ( in-city l000-718 c000 )
    ( in-city l000-745 c000 )
    ( in-city l000-490 c000 )
    ( in-city l000-406 c000 )
    ( obj-at p750 l000-490 )
    ( obj-at p383 l000-685 )
    ( obj-at p723 l000-718 )
    ( obj-at p348 l000-685 )
    ( obj-at p361 l000-685 )
    ( obj-at p952 l000-490 )
    ( obj-at p708 l000-490 )
  )
  ( :goal
    ( and
      ( obj-at p750 l000-000 )
      ( obj-at p383 l000-000 )
      ( obj-at p723 l000-000 )
      ( obj-at p348 l000-000 )
      ( obj-at p361 l000-000 )
      ( obj-at p952 l000-000 )
      ( obj-at p708 l000-000 )
    )
  )
)
