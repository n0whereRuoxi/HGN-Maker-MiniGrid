( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b737 - block
    b86 - block
    b915 - block
    b189 - block
    b25 - block
    b682 - block
    b338 - block
    b769 - block
    b24 - block
    b506 - block
    b136 - block
    b830 - block
    b991 - block
    b23 - block
    b627 - block
    b702 - block
    b497 - block
    b452 - block
    b192 - block
    b852 - block
    b959 - block
    b685 - block
    b970 - block
    b564 - block
    b47 - block
    b147 - block
    b809 - block
    b261 - block
    b974 - block
    b376 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b737 )
    ( on b86 b737 )
    ( on b915 b86 )
    ( on b189 b915 )
    ( on b25 b189 )
    ( on b682 b25 )
    ( on b338 b682 )
    ( on b769 b338 )
    ( on b24 b769 )
    ( on b506 b24 )
    ( on b136 b506 )
    ( on b830 b136 )
    ( on b991 b830 )
    ( on b23 b991 )
    ( on b627 b23 )
    ( on b702 b627 )
    ( on b497 b702 )
    ( on b452 b497 )
    ( on b192 b452 )
    ( on b852 b192 )
    ( on b959 b852 )
    ( on b685 b959 )
    ( on b970 b685 )
    ( on b564 b970 )
    ( on b47 b564 )
    ( on b147 b47 )
    ( on b809 b147 )
    ( on b261 b809 )
    ( on b974 b261 )
    ( on b376 b974 )
    ( clear b376 )
  )
  ( :goal
    ( and
      ( clear b737 )
    )
  )
)
