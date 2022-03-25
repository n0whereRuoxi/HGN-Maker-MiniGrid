( define ( htn-problem probname )
  ( :domain logistics )
  ( :requirements :strips :htn :typing :equality )
  ( :objects
    c000 - city
    t000-000 - truck
    l000-000 - location
    l000-182 - location
    l000-749 - location
    l000-470 - location
    l000-821 - location
    l000-578 - location
    l000-603 - location
    l000-826 - location
    l000-814 - location
    l000-735 - location
    l000-916 - location
    l000-288 - location
    l000-131 - location
    p129 - obj
    p105 - obj
    p851 - obj
    p693 - obj
    p143 - obj
    p28 - obj
    p156 - obj
    p467 - obj
    p52 - obj
    p666 - obj
    p405 - obj
    p171 - obj
    p571 - obj
  )
  ( :init
    ( in-city l000-000 c000 )
    ( airport l000-000 )
    ( truck-at t000-000 l000-000 )
    ( in-city l000-182 c000 )
    ( in-city l000-749 c000 )
    ( in-city l000-470 c000 )
    ( in-city l000-821 c000 )
    ( in-city l000-578 c000 )
    ( in-city l000-603 c000 )
    ( in-city l000-826 c000 )
    ( in-city l000-814 c000 )
    ( in-city l000-735 c000 )
    ( in-city l000-916 c000 )
    ( in-city l000-288 c000 )
    ( in-city l000-131 c000 )
    ( obj-at p129 l000-749 )
    ( obj-at p105 l000-814 )
    ( obj-at p851 l000-182 )
    ( obj-at p693 l000-814 )
    ( obj-at p143 l000-826 )
    ( obj-at p28 l000-814 )
    ( obj-at p156 l000-131 )
    ( obj-at p467 l000-821 )
    ( obj-at p52 l000-821 )
    ( obj-at p666 l000-749 )
    ( obj-at p405 l000-182 )
    ( obj-at p171 l000-916 )
    ( obj-at p571 l000-814 )
  )
  ( :tasks
    ( Deliver-13Pkg p129 p105 p851 p693 p143 p28 p156 p467 p52 p666 p405 p171 p571 l000-000 )
  )
)
