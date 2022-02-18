( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-303 - location
    l000-28 - location
    l000-905 - location
    l000-68 - location
    l000-573 - location
    l000-390 - location
    l000-19 - location
    l000-911 - location
    l000-345 - location
    l000-557 - location
    p480 - obj
    p439 - obj
    p966 - obj
    p748 - obj
    p819 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-303 c000 )
    ( in-city l000-28 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-68 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-390 c000 )
    ( in-city l000-19 c000 )
    ( in-city l000-911 c000 )
    ( in-city l000-345 c000 )
    ( in-city l000-557 c000 )
    ( obj-at p480 l000-905 )
    ( obj-at p439 l000-905 )
    ( obj-at p966 l000-911 )
    ( obj-at p748 l000-911 )
    ( obj-at p819 l000-19 )
  )
  ( :goal
    ( and
      ( obj-at p480 l000-000 )
      ( obj-at p439 l000-000 )
      ( obj-at p966 l000-000 )
      ( obj-at p748 l000-000 )
      ( obj-at p819 l000-000 )
    )
  )
)
