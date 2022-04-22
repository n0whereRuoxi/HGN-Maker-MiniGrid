( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-477 - location
    l000-100 - location
    l000-420 - location
    l000-662 - location
    l000-854 - location
    l000-783 - location
    l000-490 - location
    l000-602 - location
    l000-172 - location
    l000-955 - location
    l000-738 - location
    l000-891 - location
    l000-342 - location
    l000-350 - location
    l000-212 - location
    l000-536 - location
    l000-316 - location
    l000-795 - location
    l000-253 - location
    l000-601 - location
    l000-467 - location
    l000-47 - location
    p57 - obj
    p333 - obj
    p147 - obj
    p439 - obj
    p51 - obj
    p956 - obj
    p944 - obj
    p840 - obj
    p468 - obj
    p225 - obj
    p142 - obj
    p414 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-477 c000 )
    ( in-city l000-100 c000 )
    ( in-city l000-420 c000 )
    ( in-city l000-662 c000 )
    ( in-city l000-854 c000 )
    ( in-city l000-783 c000 )
    ( in-city l000-490 c000 )
    ( in-city l000-602 c000 )
    ( in-city l000-172 c000 )
    ( in-city l000-955 c000 )
    ( in-city l000-738 c000 )
    ( in-city l000-891 c000 )
    ( in-city l000-342 c000 )
    ( in-city l000-350 c000 )
    ( in-city l000-212 c000 )
    ( in-city l000-536 c000 )
    ( in-city l000-316 c000 )
    ( in-city l000-795 c000 )
    ( in-city l000-253 c000 )
    ( in-city l000-601 c000 )
    ( in-city l000-467 c000 )
    ( in-city l000-47 c000 )
    ( obj-at p57 l000-420 )
    ( obj-at p333 l000-467 )
    ( obj-at p147 l000-350 )
    ( obj-at p439 l000-662 )
    ( obj-at p51 l000-47 )
    ( obj-at p956 l000-854 )
    ( obj-at p944 l000-212 )
    ( obj-at p840 l000-601 )
    ( obj-at p468 l000-738 )
    ( obj-at p225 l000-795 )
    ( obj-at p142 l000-467 )
    ( obj-at p414 l000-100 )
  )
  ( :tasks
    ( Deliver-12Pkg p57 p333 p147 p439 p51 p956 p944 p840 p468 p225 p142 p414 l000-000 )
  )
)
