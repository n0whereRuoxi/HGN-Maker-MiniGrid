( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b309 - block
    b284 - block
    b214 - block
    b157 - block
    b939 - block
    b672 - block
    b427 - block
    b828 - block
    b566 - block
    b187 - block
    b754 - block
    b105 - block
    b484 - block
    b703 - block
    b300 - block
    b761 - block
    b371 - block
    b985 - block
    b947 - block
    b920 - block
    b581 - block
    b602 - block
    b317 - block
    b308 - block
    b975 - block
    b767 - block
    b542 - block
    b929 - block
    b22 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b309 )
    ( on b284 b309 )
    ( on b214 b284 )
    ( on b157 b214 )
    ( on b939 b157 )
    ( on b672 b939 )
    ( on b427 b672 )
    ( on b828 b427 )
    ( on b566 b828 )
    ( on b187 b566 )
    ( on b754 b187 )
    ( on b105 b754 )
    ( on b484 b105 )
    ( on b703 b484 )
    ( on b300 b703 )
    ( on b761 b300 )
    ( on b371 b761 )
    ( on b985 b371 )
    ( on b947 b985 )
    ( on b920 b947 )
    ( on b581 b920 )
    ( on b602 b581 )
    ( on b317 b602 )
    ( on b308 b317 )
    ( on b975 b308 )
    ( on b767 b975 )
    ( on b542 b767 )
    ( on b929 b542 )
    ( on b22 b929 )
    ( clear b22 )
  )
  ( :goal
    ( and
      ( clear b309 )
    )
  )
)
