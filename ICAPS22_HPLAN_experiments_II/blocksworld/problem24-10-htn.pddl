( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b115 - block
    b221 - block
    b307 - block
    b258 - block
    b85 - block
    b895 - block
    b100 - block
    b218 - block
    b548 - block
    b189 - block
    b390 - block
    b858 - block
    b749 - block
    b990 - block
    b773 - block
    b377 - block
    b338 - block
    b106 - block
    b659 - block
    b967 - block
    b673 - block
    b233 - block
    b612 - block
    b892 - block
    b62 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b115 )
    ( on b221 b115 )
    ( on b307 b221 )
    ( on b258 b307 )
    ( on b85 b258 )
    ( on b895 b85 )
    ( on b100 b895 )
    ( on b218 b100 )
    ( on b548 b218 )
    ( on b189 b548 )
    ( on b390 b189 )
    ( on b858 b390 )
    ( on b749 b858 )
    ( on b990 b749 )
    ( on b773 b990 )
    ( on b377 b773 )
    ( on b338 b377 )
    ( on b106 b338 )
    ( on b659 b106 )
    ( on b967 b659 )
    ( on b673 b967 )
    ( on b233 b673 )
    ( on b612 b233 )
    ( on b892 b612 )
    ( on b62 b892 )
    ( clear b62 )
  )
  ( :tasks
    ( Make-24Pile b221 b307 b258 b85 b895 b100 b218 b548 b189 b390 b858 b749 b990 b773 b377 b338 b106 b659 b967 b673 b233 b612 b892 b62 )
  )
)
