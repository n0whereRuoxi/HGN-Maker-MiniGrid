( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-852 - location
    l000-636 - location
    l000-751 - location
    l000-310 - location
    l000-571 - location
    l000-779 - location
    l000-735 - location
    l000-995 - location
    l000-656 - location
    l000-439 - location
    l000-79 - location
    l000-550 - location
    l000-759 - location
    l000-962 - location
    p137 - obj
    p876 - obj
    p671 - obj
    p400 - obj
    p32 - obj
    p286 - obj
    p393 - obj
    p733 - obj
    p994 - obj
    p903 - obj
    p772 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-852 c000 )
    ( in-city l000-636 c000 )
    ( in-city l000-751 c000 )
    ( in-city l000-310 c000 )
    ( in-city l000-571 c000 )
    ( in-city l000-779 c000 )
    ( in-city l000-735 c000 )
    ( in-city l000-995 c000 )
    ( in-city l000-656 c000 )
    ( in-city l000-439 c000 )
    ( in-city l000-79 c000 )
    ( in-city l000-550 c000 )
    ( in-city l000-759 c000 )
    ( in-city l000-962 c000 )
    ( obj-at p137 l000-852 )
    ( obj-at p876 l000-310 )
    ( obj-at p671 l000-751 )
    ( obj-at p400 l000-995 )
    ( obj-at p32 l000-79 )
    ( obj-at p286 l000-751 )
    ( obj-at p393 l000-735 )
    ( obj-at p733 l000-571 )
    ( obj-at p994 l000-310 )
    ( obj-at p903 l000-852 )
    ( obj-at p772 l000-779 )
  )
  ( :tasks
    ( Deliver-11Pkg p137 p876 p671 p400 p32 p286 p393 p733 p994 p903 p772 l000-000 )
  )
)
