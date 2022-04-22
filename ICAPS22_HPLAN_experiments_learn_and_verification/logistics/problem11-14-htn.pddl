( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-428 - location
    l000-654 - location
    l000-326 - location
    l000-361 - location
    l000-238 - location
    l000-443 - location
    l000-240 - location
    l000-131 - location
    l000-982 - location
    l000-589 - location
    l000-666 - location
    l000-358 - location
    l000-254 - location
    l000-517 - location
    l000-14 - location
    l000-923 - location
    p981 - obj
    p321 - obj
    p280 - obj
    p264 - obj
    p833 - obj
    p363 - obj
    p878 - obj
    p577 - obj
    p501 - obj
    p995 - obj
    p889 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-428 c000 )
    ( in-city l000-654 c000 )
    ( in-city l000-326 c000 )
    ( in-city l000-361 c000 )
    ( in-city l000-238 c000 )
    ( in-city l000-443 c000 )
    ( in-city l000-240 c000 )
    ( in-city l000-131 c000 )
    ( in-city l000-982 c000 )
    ( in-city l000-589 c000 )
    ( in-city l000-666 c000 )
    ( in-city l000-358 c000 )
    ( in-city l000-254 c000 )
    ( in-city l000-517 c000 )
    ( in-city l000-14 c000 )
    ( in-city l000-923 c000 )
    ( obj-at p981 l000-982 )
    ( obj-at p321 l000-361 )
    ( obj-at p280 l000-361 )
    ( obj-at p264 l000-428 )
    ( obj-at p833 l000-428 )
    ( obj-at p363 l000-361 )
    ( obj-at p878 l000-982 )
    ( obj-at p577 l000-443 )
    ( obj-at p501 l000-240 )
    ( obj-at p995 l000-589 )
    ( obj-at p889 l000-443 )
  )
  ( :tasks
    ( Deliver-11Pkg p981 p321 p280 p264 p833 p363 p878 p577 p501 p995 p889 l000-000 )
  )
)
