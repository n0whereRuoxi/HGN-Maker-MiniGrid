( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-608 - location
    l000-813 - location
    l000-611 - location
    l000-872 - location
    l000-886 - location
    l000-863 - location
    l000-574 - location
    l000-469 - location
    l000-996 - location
    l000-591 - location
    l000-93 - location
    p874 - obj
    p740 - obj
    p685 - obj
    p472 - obj
    p229 - obj
    p68 - obj
    p658 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-608 c000 )
    ( in-city l000-813 c000 )
    ( in-city l000-611 c000 )
    ( in-city l000-872 c000 )
    ( in-city l000-886 c000 )
    ( in-city l000-863 c000 )
    ( in-city l000-574 c000 )
    ( in-city l000-469 c000 )
    ( in-city l000-996 c000 )
    ( in-city l000-591 c000 )
    ( in-city l000-93 c000 )
    ( obj-at p874 l000-996 )
    ( obj-at p740 l000-996 )
    ( obj-at p685 l000-574 )
    ( obj-at p472 l000-813 )
    ( obj-at p229 l000-608 )
    ( obj-at p68 l000-611 )
    ( obj-at p658 l000-863 )
  )
  ( :goal
    ( and
      ( obj-at p874 l000-000 )
      ( obj-at p740 l000-000 )
      ( obj-at p685 l000-000 )
      ( obj-at p472 l000-000 )
      ( obj-at p229 l000-000 )
      ( obj-at p68 l000-000 )
      ( obj-at p658 l000-000 )
    )
  )
)
