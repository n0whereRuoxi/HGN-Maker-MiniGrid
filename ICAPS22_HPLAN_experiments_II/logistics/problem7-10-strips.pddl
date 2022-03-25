( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-25 - location
    l000-560 - location
    l000-661 - location
    l000-835 - location
    l000-829 - location
    p906 - obj
    p125 - obj
    p894 - obj
    p175 - obj
    p159 - obj
    p807 - obj
    p593 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-25 c000 )
    ( in-city l000-560 c000 )
    ( in-city l000-661 c000 )
    ( in-city l000-835 c000 )
    ( in-city l000-829 c000 )
    ( obj-at p906 l000-829 )
    ( obj-at p125 l000-829 )
    ( obj-at p894 l000-25 )
    ( obj-at p175 l000-829 )
    ( obj-at p159 l000-829 )
    ( obj-at p807 l000-829 )
    ( obj-at p593 l000-560 )
  )
  ( :goal
    ( and
      ( obj-at p906 l000-000 )
      ( obj-at p125 l000-000 )
      ( obj-at p894 l000-000 )
      ( obj-at p175 l000-000 )
      ( obj-at p159 l000-000 )
      ( obj-at p807 l000-000 )
      ( obj-at p593 l000-000 )
    )
  )
)
