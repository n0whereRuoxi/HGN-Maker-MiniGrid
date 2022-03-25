( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-96 - location
    l000-113 - location
    l000-451 - location
    l000-461 - location
    l000-505 - location
    l000-581 - location
    l000-700 - location
    l000-517 - location
    l000-852 - location
    l000-402 - location
    p757 - obj
    p894 - obj
    p298 - obj
    p219 - obj
    p837 - obj
    p941 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-96 c000 )
    ( in-city l000-113 c000 )
    ( in-city l000-451 c000 )
    ( in-city l000-461 c000 )
    ( in-city l000-505 c000 )
    ( in-city l000-581 c000 )
    ( in-city l000-700 c000 )
    ( in-city l000-517 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-402 c000 )
    ( obj-at p757 l000-461 )
    ( obj-at p894 l000-451 )
    ( obj-at p298 l000-96 )
    ( obj-at p219 l000-517 )
    ( obj-at p837 l000-113 )
    ( obj-at p941 l000-451 )
  )
  ( :goal
    ( and
      ( obj-at p757 l000-000 )
      ( obj-at p894 l000-000 )
      ( obj-at p298 l000-000 )
      ( obj-at p219 l000-000 )
      ( obj-at p837 l000-000 )
      ( obj-at p941 l000-000 )
    )
  )
)
