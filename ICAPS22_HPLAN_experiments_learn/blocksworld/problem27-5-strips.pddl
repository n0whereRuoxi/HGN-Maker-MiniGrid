( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b682 - block
    b312 - block
    b791 - block
    b967 - block
    b736 - block
    b593 - block
    b556 - block
    b997 - block
    b872 - block
    b885 - block
    b228 - block
    b398 - block
    b16 - block
    b259 - block
    b112 - block
    b761 - block
    b917 - block
    b800 - block
    b581 - block
    b145 - block
    b279 - block
    b937 - block
    b82 - block
    b106 - block
    b295 - block
    b247 - block
    b45 - block
    b255 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b682 )
    ( on b312 b682 )
    ( on b791 b312 )
    ( on b967 b791 )
    ( on b736 b967 )
    ( on b593 b736 )
    ( on b556 b593 )
    ( on b997 b556 )
    ( on b872 b997 )
    ( on b885 b872 )
    ( on b228 b885 )
    ( on b398 b228 )
    ( on b16 b398 )
    ( on b259 b16 )
    ( on b112 b259 )
    ( on b761 b112 )
    ( on b917 b761 )
    ( on b800 b917 )
    ( on b581 b800 )
    ( on b145 b581 )
    ( on b279 b145 )
    ( on b937 b279 )
    ( on b82 b937 )
    ( on b106 b82 )
    ( on b295 b106 )
    ( on b247 b295 )
    ( on b45 b247 )
    ( on b255 b45 )
    ( clear b255 )
  )
  ( :goal
    ( and
      ( clear b682 )
    )
  )
)
