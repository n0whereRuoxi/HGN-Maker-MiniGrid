( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b600 - block
    b491 - block
    b766 - block
    b957 - block
    b378 - block
    b159 - block
    b187 - block
    b453 - block
    b995 - block
    b16 - block
    b580 - block
    b606 - block
    b282 - block
    b505 - block
    b402 - block
    b375 - block
    b929 - block
    b20 - block
    b106 - block
    b74 - block
    b974 - block
    b932 - block
    b78 - block
    b139 - block
    b180 - block
    b811 - block
    b437 - block
    b988 - block
    b497 - block
    b681 - block
    b7 - block
    b635 - block
    b14 - block
    b922 - block
    b368 - block
    b248 - block
    b265 - block
    b19 - block
    b495 - block
    b182 - block
    b873 - block
    b66 - block
    b781 - block
    b998 - block
    b399 - block
    b662 - block
    b736 - block
    b718 - block
    b344 - block
    b806 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b600 )
    ( on b491 b600 )
    ( on b766 b491 )
    ( on b957 b766 )
    ( on b378 b957 )
    ( on b159 b378 )
    ( on b187 b159 )
    ( on b453 b187 )
    ( on b995 b453 )
    ( on b16 b995 )
    ( on b580 b16 )
    ( on b606 b580 )
    ( on b282 b606 )
    ( on b505 b282 )
    ( on b402 b505 )
    ( on b375 b402 )
    ( on b929 b375 )
    ( on b20 b929 )
    ( on b106 b20 )
    ( on b74 b106 )
    ( on b974 b74 )
    ( on b932 b974 )
    ( on b78 b932 )
    ( on b139 b78 )
    ( on b180 b139 )
    ( on b811 b180 )
    ( on b437 b811 )
    ( on b988 b437 )
    ( on b497 b988 )
    ( on b681 b497 )
    ( on b7 b681 )
    ( on b635 b7 )
    ( on b14 b635 )
    ( on b922 b14 )
    ( on b368 b922 )
    ( on b248 b368 )
    ( on b265 b248 )
    ( on b19 b265 )
    ( on b495 b19 )
    ( on b182 b495 )
    ( on b873 b182 )
    ( on b66 b873 )
    ( on b781 b66 )
    ( on b998 b781 )
    ( on b399 b998 )
    ( on b662 b399 )
    ( on b736 b662 )
    ( on b718 b736 )
    ( on b344 b718 )
    ( on b806 b344 )
    ( clear b806 )
  )
  ( :goal
    ( and
      ( clear b600 )
    )
  )
)
