( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-399 - location
    l000-577 - location
    l000-925 - location
    l000-498 - location
    l000-373 - location
    l000-821 - location
    l000-228 - location
    l000-247 - location
    l000-177 - location
    l000-573 - location
    l000-939 - location
    l000-25 - location
    l000-274 - location
    l000-831 - location
    l000-7 - location
    l000-713 - location
    l000-955 - location
    l000-30 - location
    l000-575 - location
    l000-8 - location
    l000-84 - location
    l000-635 - location
    p173 - obj
    p602 - obj
    p955 - obj
    p759 - obj
    p11 - obj
    p580 - obj
    p986 - obj
    p911 - obj
    p334 - obj
    p920 - obj
    p720 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-399 c000 )
    ( in-city l000-577 c000 )
    ( in-city l000-925 c000 )
    ( in-city l000-498 c000 )
    ( in-city l000-373 c000 )
    ( in-city l000-821 c000 )
    ( in-city l000-228 c000 )
    ( in-city l000-247 c000 )
    ( in-city l000-177 c000 )
    ( in-city l000-573 c000 )
    ( in-city l000-939 c000 )
    ( in-city l000-25 c000 )
    ( in-city l000-274 c000 )
    ( in-city l000-831 c000 )
    ( in-city l000-7 c000 )
    ( in-city l000-713 c000 )
    ( in-city l000-955 c000 )
    ( in-city l000-30 c000 )
    ( in-city l000-575 c000 )
    ( in-city l000-8 c000 )
    ( in-city l000-84 c000 )
    ( in-city l000-635 c000 )
    ( obj-at p173 l000-7 )
    ( obj-at p602 l000-228 )
    ( obj-at p955 l000-939 )
    ( obj-at p759 l000-30 )
    ( obj-at p11 l000-955 )
    ( obj-at p580 l000-274 )
    ( obj-at p986 l000-274 )
    ( obj-at p911 l000-177 )
    ( obj-at p334 l000-8 )
    ( obj-at p920 l000-821 )
    ( obj-at p720 l000-821 )
  )
  ( :tasks
    ( Deliver-11Pkg p173 p602 p955 p759 p11 p580 p986 p911 p334 p920 p720 l000-000 )
  )
)
