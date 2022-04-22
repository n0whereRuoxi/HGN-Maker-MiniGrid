( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-757 - location
    l000-651 - location
    l000-782 - location
    l000-59 - location
    l000-674 - location
    l000-943 - location
    l000-745 - location
    l000-349 - location
    l000-229 - location
    l000-896 - location
    l000-852 - location
    l000-763 - location
    l000-855 - location
    l000-847 - location
    l000-942 - location
    p366 - obj
    p253 - obj
    p298 - obj
    p111 - obj
    p892 - obj
    p653 - obj
    p469 - obj
    p614 - obj
    p403 - obj
    p213 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-757 c000 )
    ( in-city l000-651 c000 )
    ( in-city l000-782 c000 )
    ( in-city l000-59 c000 )
    ( in-city l000-674 c000 )
    ( in-city l000-943 c000 )
    ( in-city l000-745 c000 )
    ( in-city l000-349 c000 )
    ( in-city l000-229 c000 )
    ( in-city l000-896 c000 )
    ( in-city l000-852 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-855 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-942 c000 )
    ( obj-at p366 l000-674 )
    ( obj-at p253 l000-896 )
    ( obj-at p298 l000-847 )
    ( obj-at p111 l000-855 )
    ( obj-at p892 l000-349 )
    ( obj-at p653 l000-349 )
    ( obj-at p469 l000-59 )
    ( obj-at p614 l000-847 )
    ( obj-at p403 l000-651 )
    ( obj-at p213 l000-229 )
  )
  ( :goal
    ( and
      ( obj-at p366 l000-000 )
      ( obj-at p253 l000-000 )
      ( obj-at p298 l000-000 )
      ( obj-at p111 l000-000 )
      ( obj-at p892 l000-000 )
      ( obj-at p653 l000-000 )
      ( obj-at p469 l000-000 )
      ( obj-at p614 l000-000 )
      ( obj-at p403 l000-000 )
      ( obj-at p213 l000-000 )
    )
  )
)
