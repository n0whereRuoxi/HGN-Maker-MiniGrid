( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-367 - location
    l000-539 - location
    l000-705 - location
    l000-239 - location
    l000-322 - location
    l000-932 - location
    l000-631 - location
    l000-183 - location
    l000-217 - location
    l000-387 - location
    l000-599 - location
    p201 - obj
    p708 - obj
    p705 - obj
    p131 - obj
    p702 - obj
    p13 - obj
    p999 - obj
    p645 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-367 c000 )
    ( in-city l000-539 c000 )
    ( in-city l000-705 c000 )
    ( in-city l000-239 c000 )
    ( in-city l000-322 c000 )
    ( in-city l000-932 c000 )
    ( in-city l000-631 c000 )
    ( in-city l000-183 c000 )
    ( in-city l000-217 c000 )
    ( in-city l000-387 c000 )
    ( in-city l000-599 c000 )
    ( obj-at p201 l000-183 )
    ( obj-at p708 l000-631 )
    ( obj-at p705 l000-705 )
    ( obj-at p131 l000-932 )
    ( obj-at p702 l000-217 )
    ( obj-at p13 l000-599 )
    ( obj-at p999 l000-367 )
    ( obj-at p645 l000-932 )
  )
  ( :goal
    ( and
      ( obj-at p201 l000-000 )
      ( obj-at p708 l000-000 )
      ( obj-at p705 l000-000 )
      ( obj-at p131 l000-000 )
      ( obj-at p702 l000-000 )
      ( obj-at p13 l000-000 )
      ( obj-at p999 l000-000 )
      ( obj-at p645 l000-000 )
    )
  )
)
