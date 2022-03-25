( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-274 - location
    l000-450 - location
    l000-158 - location
    l000-162 - location
    l000-418 - location
    l000-967 - location
    l000-276 - location
    l000-90 - location
    l000-6 - location
    l000-159 - location
    l000-187 - location
    l000-561 - location
    l000-835 - location
    l000-67 - location
    l000-898 - location
    l000-918 - location
    l000-937 - location
    l000-741 - location
    l000-768 - location
    l000-329 - location
    l000-969 - location
    l000-388 - location
    l000-651 - location
    p738 - obj
    p979 - obj
    p770 - obj
    p919 - obj
    p847 - obj
    p562 - obj
    p903 - obj
    p642 - obj
    p11 - obj
    p805 - obj
    p97 - obj
    p424 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-274 c000 )
    ( in-city l000-450 c000 )
    ( in-city l000-158 c000 )
    ( in-city l000-162 c000 )
    ( in-city l000-418 c000 )
    ( in-city l000-967 c000 )
    ( in-city l000-276 c000 )
    ( in-city l000-90 c000 )
    ( in-city l000-6 c000 )
    ( in-city l000-159 c000 )
    ( in-city l000-187 c000 )
    ( in-city l000-561 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-67 c000 )
    ( in-city l000-898 c000 )
    ( in-city l000-918 c000 )
    ( in-city l000-937 c000 )
    ( in-city l000-741 c000 )
    ( in-city l000-768 c000 )
    ( in-city l000-329 c000 )
    ( in-city l000-969 c000 )
    ( in-city l000-388 c000 )
    ( in-city l000-651 c000 )
    ( obj-at p738 l000-418 )
    ( obj-at p979 l000-835 )
    ( obj-at p770 l000-67 )
    ( obj-at p919 l000-158 )
    ( obj-at p847 l000-6 )
    ( obj-at p562 l000-90 )
    ( obj-at p903 l000-329 )
    ( obj-at p642 l000-561 )
    ( obj-at p11 l000-835 )
    ( obj-at p805 l000-651 )
    ( obj-at p97 l000-274 )
    ( obj-at p424 l000-418 )
  )
  ( :goal
    ( and
      ( obj-at p738 l000-000 )
      ( obj-at p979 l000-000 )
      ( obj-at p770 l000-000 )
      ( obj-at p919 l000-000 )
      ( obj-at p847 l000-000 )
      ( obj-at p562 l000-000 )
      ( obj-at p903 l000-000 )
      ( obj-at p642 l000-000 )
      ( obj-at p11 l000-000 )
      ( obj-at p805 l000-000 )
      ( obj-at p97 l000-000 )
      ( obj-at p424 l000-000 )
    )
  )
)
