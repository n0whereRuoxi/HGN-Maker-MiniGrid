( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-628 - location
    l000-994 - location
    l000-269 - location
    l000-921 - location
    l000-121 - location
    l000-277 - location
    l000-809 - location
    l000-935 - location
    l000-300 - location
    l000-48 - location
    l000-387 - location
    l000-763 - location
    l000-444 - location
    l000-430 - location
    l000-291 - location
    l000-681 - location
    l000-178 - location
    l000-687 - location
    p810 - obj
    p799 - obj
    p291 - obj
    p859 - obj
    p276 - obj
    p312 - obj
    p513 - obj
    p115 - obj
    p279 - obj
    p345 - obj
    p536 - obj
    p206 - obj
    p849 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-628 c000 )
    ( in-city l000-994 c000 )
    ( in-city l000-269 c000 )
    ( in-city l000-921 c000 )
    ( in-city l000-121 c000 )
    ( in-city l000-277 c000 )
    ( in-city l000-809 c000 )
    ( in-city l000-935 c000 )
    ( in-city l000-300 c000 )
    ( in-city l000-48 c000 )
    ( in-city l000-387 c000 )
    ( in-city l000-763 c000 )
    ( in-city l000-444 c000 )
    ( in-city l000-430 c000 )
    ( in-city l000-291 c000 )
    ( in-city l000-681 c000 )
    ( in-city l000-178 c000 )
    ( in-city l000-687 c000 )
    ( obj-at p810 l000-48 )
    ( obj-at p799 l000-687 )
    ( obj-at p291 l000-809 )
    ( obj-at p859 l000-681 )
    ( obj-at p276 l000-921 )
    ( obj-at p312 l000-809 )
    ( obj-at p513 l000-291 )
    ( obj-at p115 l000-430 )
    ( obj-at p279 l000-763 )
    ( obj-at p345 l000-809 )
    ( obj-at p536 l000-121 )
    ( obj-at p206 l000-178 )
    ( obj-at p849 l000-121 )
  )
  ( :tasks
    ( Deliver-13Pkg p810 p799 p291 p859 p276 p312 p513 p115 p279 p345 p536 p206 p849 l000-000 )
  )
)
