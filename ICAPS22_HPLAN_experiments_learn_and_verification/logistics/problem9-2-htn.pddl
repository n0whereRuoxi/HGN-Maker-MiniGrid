( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-499 - location
    l000-549 - location
    l000-254 - location
    l000-423 - location
    l000-180 - location
    l000-967 - location
    l000-477 - location
    l000-132 - location
    l000-59 - location
    l000-448 - location
    l000-183 - location
    l000-389 - location
    l000-188 - location
    p576 - obj
    p876 - obj
    p646 - obj
    p601 - obj
    p947 - obj
    p703 - obj
    p704 - obj
    p658 - obj
    p933 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-499 c000 )
    ( in-city l000-549 c000 )
    ( in-city l000-254 c000 )
    ( in-city l000-423 c000 )
    ( in-city l000-180 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-477 c000 )
    ( in-city l000-132 c000 )
    ( in-city l000-59 c000 )
    ( in-city l000-448 c000 )
    ( in-city l000-183 c000 )
    ( in-city l000-389 c000 )
    ( in-city l000-188 c000 )
    ( obj-at p576 l000-188 )
    ( obj-at p876 l000-254 )
    ( obj-at p646 l000-549 )
    ( obj-at p601 l000-549 )
    ( obj-at p947 l000-477 )
    ( obj-at p703 l000-389 )
    ( obj-at p704 l000-183 )
    ( obj-at p658 l000-549 )
    ( obj-at p933 l000-389 )
  )
  ( :tasks
    ( Deliver-9Pkg p576 p876 p646 p601 p947 p703 p704 p658 p933 l000-000 )
  )
)
