( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-701 - location
    l000-77 - location
    l000-54 - location
    l000-976 - location
    l000-103 - location
    l000-893 - location
    l000-76 - location
    l000-606 - location
    l000-359 - location
    l000-875 - location
    l000-274 - location
    l000-771 - location
    l000-967 - location
    l000-658 - location
    p769 - obj
    p302 - obj
    p476 - obj
    p455 - obj
    p984 - obj
    p378 - obj
    p768 - obj
    p712 - obj
    p960 - obj
    p27 - obj
    p853 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-701 c000 )
    ( in-city l000-77 c000 )
    ( in-city l000-54 c000 )
    ( in-city l000-976 c000 )
    ( in-city l000-103 c000 )
    ( in-city l000-893 c000 )
    ( in-city l000-76 c000 )
    ( in-city l000-606 c000 )
    ( in-city l000-359 c000 )
    ( in-city l000-875 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-771 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-658 c000 )
    ( obj-at p769 l000-701 )
    ( obj-at p302 l000-77 )
    ( obj-at p476 l000-701 )
    ( obj-at p455 l000-77 )
    ( obj-at p984 l000-359 )
    ( obj-at p378 l000-76 )
    ( obj-at p768 l000-875 )
    ( obj-at p712 l000-771 )
    ( obj-at p960 l000-103 )
    ( obj-at p27 l000-103 )
    ( obj-at p853 l000-658 )
  )
  ( :goal
    ( and
      ( obj-at p769 l000-000 )
      ( obj-at p302 l000-000 )
      ( obj-at p476 l000-000 )
      ( obj-at p455 l000-000 )
      ( obj-at p984 l000-000 )
      ( obj-at p378 l000-000 )
      ( obj-at p768 l000-000 )
      ( obj-at p712 l000-000 )
      ( obj-at p960 l000-000 )
      ( obj-at p27 l000-000 )
      ( obj-at p853 l000-000 )
    )
  )
)
