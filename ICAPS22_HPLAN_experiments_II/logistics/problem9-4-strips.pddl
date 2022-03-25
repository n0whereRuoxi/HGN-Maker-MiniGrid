( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-566 - location
    l000-71 - location
    l000-469 - location
    l000-30 - location
    l000-744 - location
    l000-478 - location
    l000-585 - location
    l000-291 - location
    l000-664 - location
    l000-650 - location
    l000-592 - location
    l000-894 - location
    l000-511 - location
    l000-81 - location
    l000-945 - location
    l000-413 - location
    p78 - obj
    p636 - obj
    p112 - obj
    p277 - obj
    p477 - obj
    p591 - obj
    p156 - obj
    p622 - obj
    p399 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-566 c000 )
    ( in-city l000-71 c000 )
    ( in-city l000-469 c000 )
    ( in-city l000-30 c000 )
    ( in-city l000-744 c000 )
    ( in-city l000-478 c000 )
    ( in-city l000-585 c000 )
    ( in-city l000-291 c000 )
    ( in-city l000-664 c000 )
    ( in-city l000-650 c000 )
    ( in-city l000-592 c000 )
    ( in-city l000-894 c000 )
    ( in-city l000-511 c000 )
    ( in-city l000-81 c000 )
    ( in-city l000-945 c000 )
    ( in-city l000-413 c000 )
    ( obj-at p78 l000-413 )
    ( obj-at p636 l000-585 )
    ( obj-at p112 l000-664 )
    ( obj-at p277 l000-945 )
    ( obj-at p477 l000-945 )
    ( obj-at p591 l000-664 )
    ( obj-at p156 l000-30 )
    ( obj-at p622 l000-81 )
    ( obj-at p399 l000-469 )
  )
  ( :goal
    ( and
      ( obj-at p78 l000-000 )
      ( obj-at p636 l000-000 )
      ( obj-at p112 l000-000 )
      ( obj-at p277 l000-000 )
      ( obj-at p477 l000-000 )
      ( obj-at p591 l000-000 )
      ( obj-at p156 l000-000 )
      ( obj-at p622 l000-000 )
      ( obj-at p399 l000-000 )
    )
  )
)
