( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-827 - location
    l000-380 - location
    l000-64 - location
    l000-27 - location
    l000-526 - location
    l000-386 - location
    l000-574 - location
    l000-672 - location
    l000-560 - location
    l000-872 - location
    p906 - obj
    p793 - obj
    p585 - obj
    p867 - obj
    p745 - obj
    p439 - obj
    p653 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-827 c000 )
    ( in-city l000-380 c000 )
    ( in-city l000-64 c000 )
    ( in-city l000-27 c000 )
    ( in-city l000-526 c000 )
    ( in-city l000-386 c000 )
    ( in-city l000-574 c000 )
    ( in-city l000-672 c000 )
    ( in-city l000-560 c000 )
    ( in-city l000-872 c000 )
    ( obj-at p906 l000-574 )
    ( obj-at p793 l000-827 )
    ( obj-at p585 l000-827 )
    ( obj-at p867 l000-380 )
    ( obj-at p745 l000-574 )
    ( obj-at p439 l000-827 )
    ( obj-at p653 l000-27 )
  )
  ( :goal
    ( and
      ( obj-at p906 l000-000 )
      ( obj-at p793 l000-000 )
      ( obj-at p585 l000-000 )
      ( obj-at p867 l000-000 )
      ( obj-at p745 l000-000 )
      ( obj-at p439 l000-000 )
      ( obj-at p653 l000-000 )
    )
  )
)
