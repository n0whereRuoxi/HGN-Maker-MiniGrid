( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b537 - block
    b942 - block
    b707 - block
    b200 - block
    b421 - block
    b428 - block
    b312 - block
    b876 - block
    b872 - block
    b462 - block
    b836 - block
    b265 - block
    b943 - block
    b891 - block
    b249 - block
    b130 - block
    b239 - block
    b169 - block
    b125 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b537 )
    ( on b942 b537 )
    ( on b707 b942 )
    ( on b200 b707 )
    ( on b421 b200 )
    ( on b428 b421 )
    ( on b312 b428 )
    ( on b876 b312 )
    ( on b872 b876 )
    ( on b462 b872 )
    ( on b836 b462 )
    ( on b265 b836 )
    ( on b943 b265 )
    ( on b891 b943 )
    ( on b249 b891 )
    ( on b130 b249 )
    ( on b239 b130 )
    ( on b169 b239 )
    ( on b125 b169 )
    ( clear b125 )
  )
  ( :goal
    ( and
      ( clear b537 )
    )
  )
)
