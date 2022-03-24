( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b701 - block
    b65 - block
    b665 - block
    b326 - block
    b233 - block
    b936 - block
    b816 - block
    b549 - block
    b211 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b701 )
    ( on b65 b701 )
    ( on b665 b65 )
    ( on b326 b665 )
    ( on b233 b326 )
    ( on b936 b233 )
    ( on b816 b936 )
    ( on b549 b816 )
    ( on b211 b549 )
    ( clear b211 )
  )
  ( :tasks
    ( Make-8Pile b65 b665 b326 b233 b936 b816 b549 b211 )
  )
)
