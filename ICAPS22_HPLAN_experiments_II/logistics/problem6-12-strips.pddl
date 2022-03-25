( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-886 - location
    l000-893 - location
    l000-90 - location
    l000-952 - location
    l000-878 - location
    l000-21 - location
    l000-905 - location
    l000-277 - location
    l000-595 - location
    l000-128 - location
    l000-835 - location
    p422 - obj
    p817 - obj
    p227 - obj
    p750 - obj
    p752 - obj
    p306 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-886 c000 )
    ( in-city l000-893 c000 )
    ( in-city l000-90 c000 )
    ( in-city l000-952 c000 )
    ( in-city l000-878 c000 )
    ( in-city l000-21 c000 )
    ( in-city l000-905 c000 )
    ( in-city l000-277 c000 )
    ( in-city l000-595 c000 )
    ( in-city l000-128 c000 )
    ( in-city l000-835 c000 )
    ( obj-at p422 l000-90 )
    ( obj-at p817 l000-21 )
    ( obj-at p227 l000-128 )
    ( obj-at p750 l000-21 )
    ( obj-at p752 l000-952 )
    ( obj-at p306 l000-277 )
  )
  ( :goal
    ( and
      ( obj-at p422 l000-000 )
      ( obj-at p817 l000-000 )
      ( obj-at p227 l000-000 )
      ( obj-at p750 l000-000 )
      ( obj-at p752 l000-000 )
      ( obj-at p306 l000-000 )
    )
  )
)
