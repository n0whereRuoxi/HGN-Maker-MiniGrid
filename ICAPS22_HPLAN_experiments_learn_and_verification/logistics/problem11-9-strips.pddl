( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-616 - location
    l000-856 - location
    l000-692 - location
    l000-696 - location
    l000-20 - location
    l000-416 - location
    l000-658 - location
    l000-930 - location
    l000-22 - location
    l000-528 - location
    l000-860 - location
    l000-155 - location
    l000-808 - location
    l000-371 - location
    l000-112 - location
    p465 - obj
    p820 - obj
    p442 - obj
    p631 - obj
    p377 - obj
    p884 - obj
    p63 - obj
    p338 - obj
    p62 - obj
    p912 - obj
    p39 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-616 c000 )
    ( in-city l000-856 c000 )
    ( in-city l000-692 c000 )
    ( in-city l000-696 c000 )
    ( in-city l000-20 c000 )
    ( in-city l000-416 c000 )
    ( in-city l000-658 c000 )
    ( in-city l000-930 c000 )
    ( in-city l000-22 c000 )
    ( in-city l000-528 c000 )
    ( in-city l000-860 c000 )
    ( in-city l000-155 c000 )
    ( in-city l000-808 c000 )
    ( in-city l000-371 c000 )
    ( in-city l000-112 c000 )
    ( obj-at p465 l000-860 )
    ( obj-at p820 l000-416 )
    ( obj-at p442 l000-22 )
    ( obj-at p631 l000-808 )
    ( obj-at p377 l000-808 )
    ( obj-at p884 l000-692 )
    ( obj-at p63 l000-856 )
    ( obj-at p338 l000-658 )
    ( obj-at p62 l000-696 )
    ( obj-at p912 l000-692 )
    ( obj-at p39 l000-22 )
  )
  ( :goal
    ( and
      ( obj-at p465 l000-000 )
      ( obj-at p820 l000-000 )
      ( obj-at p442 l000-000 )
      ( obj-at p631 l000-000 )
      ( obj-at p377 l000-000 )
      ( obj-at p884 l000-000 )
      ( obj-at p63 l000-000 )
      ( obj-at p338 l000-000 )
      ( obj-at p62 l000-000 )
      ( obj-at p912 l000-000 )
      ( obj-at p39 l000-000 )
    )
  )
)
