( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-424 - location
    l000-50 - location
    l000-839 - location
    l000-684 - location
    l000-690 - location
    l000-14 - location
    l000-760 - location
    l000-931 - location
    l000-406 - location
    p50 - obj
    p839 - obj
    p406 - obj
    p690 - obj
    p684 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-424 c000 )
    ( in-city l000-50 c000 )
    ( in-city l000-839 c000 )
    ( in-city l000-684 c000 )
    ( in-city l000-690 c000 )
    ( in-city l000-14 c000 )
    ( in-city l000-760 c000 )
    ( in-city l000-931 c000 )
    ( in-city l000-406 c000 )
    ( obj-at p50 l000-50 )
    ( obj-at p839 l000-839 )
    ( obj-at p406 l000-406 )
    ( obj-at p690 l000-690 )
    ( obj-at p684 l000-684 )
  )
  ( :goal
    ( and
      ( obj-at p50 l000-000 )
      ( obj-at p839 l000-000 )
      ( obj-at p406 l000-000 )
      ( obj-at p690 l000-000 )
      ( obj-at p684 l000-000 )
    )
  )
)
