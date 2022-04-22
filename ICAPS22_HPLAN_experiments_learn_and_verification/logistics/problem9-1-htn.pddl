( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-891 - location
    l000-171 - location
    l000-571 - location
    l000-267 - location
    l000-788 - location
    l000-592 - location
    l000-12 - location
    l000-977 - location
    l000-205 - location
    l000-35 - location
    l000-504 - location
    l000-386 - location
    l000-866 - location
    l000-806 - location
    l000-195 - location
    l000-697 - location
    l000-604 - location
    l000-765 - location
    p838 - obj
    p524 - obj
    p66 - obj
    p818 - obj
    p249 - obj
    p904 - obj
    p130 - obj
    p350 - obj
    p515 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-891 c000 )
    ( in-city l000-171 c000 )
    ( in-city l000-571 c000 )
    ( in-city l000-267 c000 )
    ( in-city l000-788 c000 )
    ( in-city l000-592 c000 )
    ( in-city l000-12 c000 )
    ( in-city l000-977 c000 )
    ( in-city l000-205 c000 )
    ( in-city l000-35 c000 )
    ( in-city l000-504 c000 )
    ( in-city l000-386 c000 )
    ( in-city l000-866 c000 )
    ( in-city l000-806 c000 )
    ( in-city l000-195 c000 )
    ( in-city l000-697 c000 )
    ( in-city l000-604 c000 )
    ( in-city l000-765 c000 )
    ( obj-at p838 l000-765 )
    ( obj-at p524 l000-195 )
    ( obj-at p66 l000-697 )
    ( obj-at p818 l000-697 )
    ( obj-at p249 l000-571 )
    ( obj-at p904 l000-386 )
    ( obj-at p130 l000-977 )
    ( obj-at p350 l000-604 )
    ( obj-at p515 l000-866 )
  )
  ( :tasks
    ( Deliver-9Pkg p838 p524 p66 p818 p249 p904 p130 p350 p515 l000-000 )
  )
)
