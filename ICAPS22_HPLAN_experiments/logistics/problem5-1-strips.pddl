( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-12 - location
    l000-698 - location
    l000-135 - location
    l000-241 - location
    l000-899 - location
    l000-444 - location
    l000-356 - location
    l000-895 - location
    p257 - obj
    p106 - obj
    p753 - obj
    p396 - obj
    p417 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-12 c000 )
    ( in-city l000-698 c000 )
    ( in-city l000-135 c000 )
    ( in-city l000-241 c000 )
    ( in-city l000-899 c000 )
    ( in-city l000-444 c000 )
    ( in-city l000-356 c000 )
    ( in-city l000-895 c000 )
    ( obj-at p257 l000-241 )
    ( obj-at p106 l000-698 )
    ( obj-at p753 l000-356 )
    ( obj-at p396 l000-12 )
    ( obj-at p417 l000-698 )
  )
  ( :goal
    ( and
      ( obj-at p257 l000-000 )
      ( obj-at p106 l000-000 )
      ( obj-at p753 l000-000 )
      ( obj-at p396 l000-000 )
      ( obj-at p417 l000-000 )
    )
  )
)
