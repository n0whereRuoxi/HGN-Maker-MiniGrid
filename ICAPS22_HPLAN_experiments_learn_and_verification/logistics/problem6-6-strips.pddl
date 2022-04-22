( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-658 - location
    l000-190 - location
    l000-767 - location
    l000-438 - location
    l000-451 - location
    l000-334 - location
    l000-537 - location
    l000-623 - location
    l000-19 - location
    l000-630 - location
    l000-507 - location
    p218 - obj
    p926 - obj
    p303 - obj
    p217 - obj
    p289 - obj
    p293 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-658 c000 )
    ( in-city l000-190 c000 )
    ( in-city l000-767 c000 )
    ( in-city l000-438 c000 )
    ( in-city l000-451 c000 )
    ( in-city l000-334 c000 )
    ( in-city l000-537 c000 )
    ( in-city l000-623 c000 )
    ( in-city l000-19 c000 )
    ( in-city l000-630 c000 )
    ( in-city l000-507 c000 )
    ( obj-at p218 l000-630 )
    ( obj-at p926 l000-537 )
    ( obj-at p303 l000-334 )
    ( obj-at p217 l000-19 )
    ( obj-at p289 l000-623 )
    ( obj-at p293 l000-190 )
  )
  ( :goal
    ( and
      ( obj-at p218 l000-000 )
      ( obj-at p926 l000-000 )
      ( obj-at p303 l000-000 )
      ( obj-at p217 l000-000 )
      ( obj-at p289 l000-000 )
      ( obj-at p293 l000-000 )
    )
  )
)
