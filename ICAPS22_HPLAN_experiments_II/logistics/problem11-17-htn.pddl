( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-831 - location
    l000-847 - location
    l000-938 - location
    l000-274 - location
    l000-729 - location
    l000-718 - location
    l000-998 - location
    l000-575 - location
    l000-207 - location
    l000-661 - location
    l000-520 - location
    l000-469 - location
    l000-333 - location
    l000-229 - location
    l000-391 - location
    l000-344 - location
    l000-278 - location
    l000-155 - location
    l000-466 - location
    l000-233 - location
    p828 - obj
    p942 - obj
    p856 - obj
    p795 - obj
    p266 - obj
    p928 - obj
    p387 - obj
    p22 - obj
    p364 - obj
    p708 - obj
    p815 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-831 c000 )
    ( in-city l000-847 c000 )
    ( in-city l000-938 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-729 c000 )
    ( in-city l000-718 c000 )
    ( in-city l000-998 c000 )
    ( in-city l000-575 c000 )
    ( in-city l000-207 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-520 c000 )
    ( in-city l000-469 c000 )
    ( in-city l000-333 c000 )
    ( in-city l000-229 c000 )
    ( in-city l000-391 c000 )
    ( in-city l000-344 c000 )
    ( in-city l000-278 c000 )
    ( in-city l000-155 c000 )
    ( in-city l000-466 c000 )
    ( in-city l000-233 c000 )
    ( obj-at p828 l000-469 )
    ( obj-at p942 l000-274 )
    ( obj-at p856 l000-207 )
    ( obj-at p795 l000-344 )
    ( obj-at p266 l000-847 )
    ( obj-at p928 l000-207 )
    ( obj-at p387 l000-938 )
    ( obj-at p22 l000-520 )
    ( obj-at p364 l000-718 )
    ( obj-at p708 l000-998 )
    ( obj-at p815 l000-469 )
  )
  ( :tasks
    ( Deliver-11Pkg p828 p942 p856 p795 p266 p928 p387 p22 p364 p708 p815 l000-000 )
  )
)
