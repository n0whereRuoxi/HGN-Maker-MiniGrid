( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-735 - location
    l000-133 - location
    l000-374 - location
    l000-765 - location
    l000-437 - location
    l000-2 - location
    l000-105 - location
    l000-545 - location
    l000-755 - location
    l000-317 - location
    l000-129 - location
    l000-275 - location
    l000-54 - location
    l000-394 - location
    l000-930 - location
    l000-952 - location
    l000-454 - location
    p446 - obj
    p11 - obj
    p982 - obj
    p990 - obj
    p252 - obj
    p175 - obj
    p314 - obj
    p537 - obj
    p440 - obj
    p500 - obj
    p587 - obj
    p35 - obj
    p745 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-735 c000 )
    ( in-city l000-133 c000 )
    ( in-city l000-374 c000 )
    ( in-city l000-765 c000 )
    ( in-city l000-437 c000 )
    ( in-city l000-2 c000 )
    ( in-city l000-105 c000 )
    ( in-city l000-545 c000 )
    ( in-city l000-755 c000 )
    ( in-city l000-317 c000 )
    ( in-city l000-129 c000 )
    ( in-city l000-275 c000 )
    ( in-city l000-54 c000 )
    ( in-city l000-394 c000 )
    ( in-city l000-930 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-454 c000 )
    ( obj-at p446 l000-2 )
    ( obj-at p11 l000-105 )
    ( obj-at p982 l000-54 )
    ( obj-at p990 l000-545 )
    ( obj-at p252 l000-133 )
    ( obj-at p175 l000-545 )
    ( obj-at p314 l000-105 )
    ( obj-at p537 l000-394 )
    ( obj-at p440 l000-454 )
    ( obj-at p500 l000-930 )
    ( obj-at p587 l000-454 )
    ( obj-at p35 l000-394 )
    ( obj-at p745 l000-54 )
  )
  ( :goal
    ( and
      ( obj-at p446 l000-000 )
      ( obj-at p11 l000-000 )
      ( obj-at p982 l000-000 )
      ( obj-at p990 l000-000 )
      ( obj-at p252 l000-000 )
      ( obj-at p175 l000-000 )
      ( obj-at p314 l000-000 )
      ( obj-at p537 l000-000 )
      ( obj-at p440 l000-000 )
      ( obj-at p500 l000-000 )
      ( obj-at p587 l000-000 )
      ( obj-at p35 l000-000 )
      ( obj-at p745 l000-000 )
    )
  )
)
