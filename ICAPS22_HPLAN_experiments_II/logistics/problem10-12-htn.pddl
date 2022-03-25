( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-226 - location
    l000-938 - location
    l000-857 - location
    l000-671 - location
    l000-884 - location
    l000-104 - location
    p775 - obj
    p537 - obj
    p909 - obj
    p573 - obj
    p841 - obj
    p761 - obj
    p921 - obj
    p549 - obj
    p133 - obj
    p556 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-226 c000 )
    ( in-city l000-938 c000 )
    ( in-city l000-857 c000 )
    ( in-city l000-671 c000 )
    ( in-city l000-884 c000 )
    ( in-city l000-104 c000 )
    ( obj-at p775 l000-226 )
    ( obj-at p537 l000-857 )
    ( obj-at p909 l000-857 )
    ( obj-at p573 l000-938 )
    ( obj-at p841 l000-938 )
    ( obj-at p761 l000-671 )
    ( obj-at p921 l000-884 )
    ( obj-at p549 l000-226 )
    ( obj-at p133 l000-226 )
    ( obj-at p556 l000-857 )
  )
  ( :tasks
    ( Deliver-10Pkg p775 p537 p909 p573 p841 p761 p921 p549 p133 p556 l000-000 )
  )
)
